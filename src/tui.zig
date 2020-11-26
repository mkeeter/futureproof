const std = @import("std");

const c = @import("c.zig");
const ft = @import("ft.zig");
const msgpack = @import("msgpack.zig");

const Buffer = @import("buffer.zig").Buffer;
const Renderer = @import("renderer.zig").Renderer;
const RPC = @import("rpc.zig").RPC;
const Window = @import("window.zig").Window;

const FONT_NAME = "font/Inconsolata-SemiBold.ttf";
const FONT_SIZE = 16;
const SCROLL_THRESHOLD = 0.1;

pub const Tui = struct {
    const Self = @This();

    alloc: *std.mem.Allocator,

    //  These are the three components to the Tui:
    //  - The window holds the GLFW window and handles resizing
    //  - The renderer handles all the WGPU stuff
    //  - The RPC bridge talks to a subprocess
    window: Window,
    renderer: Renderer,
    rpc: RPC,
    font: ft.Atlas,

    buffers: std.AutoHashMap(u32, *Buffer),

    char_grid: [512 * 512]u32,
    x_tiles: u32,
    y_tiles: u32,
    total_tiles: u32,

    mouse_tile_x: i32,
    mouse_tile_y: i32,
    mouse_scroll_y: f64,

    //  Render state to pass into WGPU
    u: c.fpUniforms,
    uniforms_changed: bool,

    pixel_density: u32,

    pub fn deinit(self: *Self) void {
        self.rpc.deinit();
        self.font.deinit();

        var itr = self.buffers.iterator();
        while (itr.next()) |buf| {
            buf.value.deinit();
            self.alloc.destroy(buf.value);
        }
        self.buffers.deinit();

        self.alloc.destroy(self);
    }

    fn attach_buffer(self: *Self, id: u32) !void {
        var options = msgpack.KeyValueMap.init(self.alloc);
        defer options.deinit();
        const reply = try self.rpc.call("nvim_buf_attach", .{ id, false, options });
        defer self.rpc.release(reply);

        // Create a buffer on the heap and store it in the hash map.
        var buf = try self.alloc.create(Buffer);
        buf.* = try Buffer.init(self.alloc);
        try self.buffers.put(id, buf);
    }

    pub fn init(alloc: *std.mem.Allocator) !*Self {
        // We'll use an arena for transient CPU-side resources
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        var width: c_int = 640;
        var height: c_int = 480;

        var window = try Window.init(width, height, "futureproof");
        c.glfwGetFramebufferSize(window.window, &width, &height);

        const font = try ft.build_atlas(
            alloc,
            FONT_NAME,
            FONT_SIZE,
            512,
        );
        const renderer = try Renderer.init(tmp_alloc, window.window, &font);

        const x_tiles = @intCast(u32, width) / font.u.glyph_advance;
        const y_tiles = @intCast(u32, height) / font.u.glyph_height;

        // Start up the RPC subprocess, using the global allocator
        const nvim_cmd = [_][]const u8{
            "nvim",
            "--embed",
            "--clean",
            "-u",
            "config/init.vim",
        };
        var rpc = try RPC.init(&nvim_cmd, alloc);

        const out = try alloc.create(Self);
        out.* = .{
            .alloc = alloc,

            .window = window,
            .renderer = renderer,
            .rpc = rpc,
            .font = font,

            .buffers = std.AutoHashMap(u32, *Buffer).init(alloc),

            .char_grid = undefined,
            .x_tiles = 0,
            .y_tiles = 0,
            .total_tiles = 0,

            .mouse_tile_x = 0,
            .mouse_tile_y = 0,
            .mouse_scroll_y = 0.0,

            .u = c.fpUniforms{
                .width_px = @intCast(u32, width),
                .height_px = @intCast(u32, height),
                .font = font.u,

                .attrs = undefined,
                .modes = undefined,
            },
            .uniforms_changed = true,
            .pixel_density = 1,
        };
        window.set_callbacks(
            size_cb,
            key_cb,
            mouse_button_cb,
            mouse_pos_cb,
            scroll_cb,
            @ptrCast(?*c_void, out),
        );

        // Attach the UI via RPC
        {
            var options = msgpack.KeyValueMap.init(alloc);
            try options.put(
                msgpack.Key{ .RawString = "ext_linegrid" },
                msgpack.Value{ .Boolean = true },
            );
            defer options.deinit();
            const reply = try rpc.call("nvim_ui_attach", .{ x_tiles, y_tiles, options });
            defer rpc.release(reply);
        }

        { // Try to subscribe to Fp events
            var options = msgpack.KeyValueMap.init(alloc);
            defer options.deinit();
            const reply = try rpc.call("nvim_subscribe", .{"Fp"});
            defer rpc.release(reply);
        }

        // Attach to events from the first buffer
        try out.attach_buffer(1);

        out.update_size(width, height);

        return out;
    }

    fn char_at(self: *Self, x: usize, y: usize) *u32 {
        return &self.char_grid[x + y * self.x_tiles];
    }

    fn api_grid_scroll(self: *Self, line: []const msgpack.Value) void {
        const grid = line[0].UInt;
        std.debug.assert(grid == 1);

        const top = line[1].UInt;
        const bot = line[2].UInt;
        const left = line[3].UInt;
        const right = line[4].UInt;

        const cols = line[6].UInt;
        std.debug.assert(cols == 0);

        // rows > 0 --> moving rows upwards
        if (line[5] == .UInt) {
            const rows = line[5].UInt;
            var y = top;
            while (y < bot - rows) : (y += 1) {
                var x = left;
                while (x < right) : (x += 1) {
                    self.char_at(x, y).* = self.char_at(x, y + rows).*;
                }
            }
            // rows < 0 --> moving rows downwards
        } else if (line[5] == .Int) {
            const rows = @intCast(u32, -line[5].Int);
            var y = bot - 1;
            while (y >= top + rows) : (y -= 1) {
                var x = left;
                while (x < right) : (x += 1) {
                    self.char_at(x, y).* = self.char_at(x, y - rows).*;
                }
            }
        }
    }

    fn decode_utf8(char: []const u8) u32 {
        if (char[0] >> 7 == 0) {
            std.debug.assert(char.len == 1);
            return char[0];
        } else if (char[0] >> 5 == 0b110) {
            std.debug.assert(char.len == 2);
            return (@intCast(u32, char[0] & 0b00011111) << 6) |
                @intCast(u32, char[1] & 0b00111111);
        } else if (char[0] >> 4 == 0b1110) {
            std.debug.assert(char.len == 3);
            return (@intCast(u32, char[0] & 0b00001111) << 12) |
                (@intCast(u32, char[1] & 0b00111111) << 6) |
                @intCast(u32, char[2] & 0b00111111);
        } else if (char[0] >> 3 == 0b11110) {
            std.debug.assert(char.len == 4);
            return (@intCast(u32, char[0] & 0b00000111) << 18) |
                (@intCast(u32, char[1] & 0b00111111) << 12) |
                (@intCast(u32, char[2] & 0b00111111) << 6) |
                @intCast(u32, char[3] & 0b00111111);
        }
        return 0;
    }

    fn api_grid_line(self: *Self, line: []const msgpack.Value) void {
        const grid = line[0].UInt;
        std.debug.assert(grid == 1);
        var hl_attr: u16 = 0;

        const row = line[1].UInt;
        var col = line[2].UInt;
        for (line[3].Array) |cell_| {
            const cell = cell_.Array;
            const text = cell[0].RawString;
            if (cell.len >= 2) {
                hl_attr = @intCast(u16, cell[1].UInt);
            }
            const repeat = if (cell.len >= 3) cell[2].UInt else 1;
            const codepoint = decode_utf8(text);

            var char: u32 = undefined;
            if (self.font.get_glyph(codepoint)) |g| {
                char = g;
            } else {
                std.debug.print("Adding new codepoint: {x}\n", .{codepoint});
                char = self.font.add_glyph(codepoint) catch |err| {
                    std.debug.panic("Could not add glyph {}: {}\n", .{ codepoint, err });
                };
                // We've only added one glyph to the texture, so just copy
                // this one line over to our local uniforms:
                self.u.font.glyphs[char] = self.font.u.glyphs[char];

                // Then send the updated atlas and texture to the GPU
                self.renderer.update_uniforms(&self.u);
                self.renderer.update_font_tex(&self.font);
            }

            std.debug.assert(char < self.u.font.glyphs.len);
            var i: usize = 0;
            while (i < repeat) : (i += 1) {
                self.char_at(col, row).* = char | (@intCast(u32, hl_attr) << 16);
                col += 1; // TODO: unicode?!
            }
        }
    }

    fn api_flush(self: *Self, cmd: []const msgpack.Value) void {
        // Send over the character grid, along with the extra three values
        // that mark cursor position and mode within the grid
        std.debug.assert(cmd.len == 0);
        self.renderer.update_grid(self.char_grid[0 .. self.total_tiles + 3]);
    }

    fn api_grid_clear(self: *Self, cmd: []const msgpack.Value) void {
        const grid = cmd[0].UInt;
        std.debug.assert(grid == 1);
        std.mem.set(u32, self.char_grid[0..], 0);
    }

    fn api_grid_cursor_goto(self: *Self, cmd: []const msgpack.Value) void {
        const grid = cmd[0].UInt;
        std.debug.assert(grid == 1);

        // Record the cursor position at the end of the grid
        self.char_grid[self.total_tiles] = @intCast(u32, cmd[2].UInt);
        self.char_grid[self.total_tiles + 1] = @intCast(u32, cmd[1].UInt);
    }

    fn decode_hl_attrs(attr: *const msgpack.KeyValueMap) c.fpHlAttrs {
        var out = (c.fpHlAttrs){
            .foreground = 0xffffffff,
            .background = 0xffffffff,
            .special = 0xffffffff,
            .flags = 0,
        };

        var itr = attr.iterator();
        while (itr.next()) |entry| {
            if (std.mem.eql(u8, entry.key.RawString, "foreground")) {
                out.foreground = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "background")) {
                out.background = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "special")) {
                out.special = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "bold") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_BOLD;
            } else if (std.mem.eql(u8, entry.key.RawString, "italic") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_ITALIC;
            } else if (std.mem.eql(u8, entry.key.RawString, "undercurl") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_UNDERCURL;
            } else if (std.mem.eql(u8, entry.key.RawString, "reverse") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_REVERSE;
            } else if (std.mem.eql(u8, entry.key.RawString, "underline") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_UNDERLINE;
            } else if (std.mem.eql(u8, entry.key.RawString, "strikethrough") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_STRIKETHROUGH;
            } else if (std.mem.eql(u8, entry.key.RawString, "standout") and entry.value.Boolean) {
                out.flags |= c.FP_FLAG_STANDOUT;
            } else {
                std.debug.warn("Unknown hlAttr: {} {}\n", .{ entry.key, entry.value });
            }
        }
        return out;
    }

    fn api_hl_attr_define(self: *Self, cmd: []const msgpack.Value) void {
        // Decode rgb_attrs into the appropriate slot
        const id = cmd[0].UInt;
        std.debug.assert(id < c.FP_MAX_ATTRS);
        self.u.attrs[id] = decode_hl_attrs(&cmd[1].Map);
        self.uniforms_changed = true;
    }

    fn decode_mode(mode: *const msgpack.KeyValueMap) c.fpMode {
        var out = (c.fpMode){
            .cursor_shape = c.FP_CURSOR_BLOCK,
            .cell_percentage = 100,
            .blinkwait = 0,
            .blinkon = 0,
            .blinkoff = 0,
            .attr_id = 0,
        };
        var itr = mode.iterator();
        while (itr.next()) |entry| {
            if (std.mem.eql(u8, entry.key.RawString, "cursor_shape")) {
                if (std.mem.eql(u8, entry.value.RawString, "horizontal")) {
                    out.cursor_shape = c.FP_CURSOR_HORIZONTAL;
                } else if (std.mem.eql(u8, entry.value.RawString, "vertical")) {
                    out.cursor_shape = c.FP_CURSOR_VERTICAL;
                } else if (std.mem.eql(u8, entry.value.RawString, "block")) {
                    out.cursor_shape = c.FP_CURSOR_BLOCK;
                } else {
                    std.debug.panic("Unknown cursor shape: {}\n", .{entry.value});
                }
            } else if (std.mem.eql(u8, entry.key.RawString, "cell_percentage")) {
                out.cell_percentage = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "blinkwait")) {
                out.blinkwait = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "blinkon")) {
                out.blinkon = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "blinkoff")) {
                out.blinkoff = @intCast(u32, entry.value.UInt);
            } else if (std.mem.eql(u8, entry.key.RawString, "attr_id")) {
                out.attr_id = @intCast(u32, entry.value.UInt);
            } else {
                // Ignore other elements for now
            }
        }
        return out;
    }

    fn api_mode_info_set(self: *Self, cmd: []const msgpack.Value) void {
        const cursor_style_enabled = cmd[0].Boolean; // unused for now?
        std.debug.assert(cmd[1].Array.len < c.FP_MAX_MODES);
        var i: u32 = 0;
        while (i < cmd[1].Array.len) : (i += 1) {
            self.u.modes[i] = decode_mode(&cmd[1].Array[i].Map);
        }
    }

    fn api_mode_change(self: *Self, cmd: []const msgpack.Value) void {
        self.char_grid[self.total_tiles + 2] = @intCast(u32, cmd[1].UInt);
    }

    fn api_default_colors_set(self: *Self, cmd: []const msgpack.Value) void {
        self.u.attrs[0] = (c.fpHlAttrs){
            .foreground = @intCast(u32, cmd[0].UInt),
            .background = @intCast(u32, cmd[1].UInt),
            .special = @intCast(u32, cmd[2].UInt),
            .flags = 0,
        };
        self.uniforms_changed = true;
    }

    fn call_method(self: *Self, event: []const msgpack.Value) !void {
        const target = event[2].Array[0].Ext;
        if (target.type == 0) { // Buffer
            const buf_num = try target.as_u32();
            var done = false;
            if (self.buffers.get(buf_num)) |buf| {
                done = buf.rpc_method(
                    event[1].RawString,
                    event[2].Array[1..],
                );
            } else {
                std.debug.warn("Invalid buffer: {}\n", .{buf_num});
            }
            // Destroy the buffer if requested
            if (done) {
                if (self.buffers.remove(buf_num)) |buf| {
                    buf.value.deinit();
                    self.alloc.destroy(buf.value);
                } else {
                    unreachable;
                }
            }
        } else {
            std.debug.warn("Unknown method target: {}\n", .{target.type});
        }
    }

    fn call_fp(self: *Self, event: []const msgpack.Value) !void {
        std.debug.print("Fp event:\n   ", .{});
        for (event) |a| {
            std.debug.print("{}", .{a});
        }
        std.debug.print("\n    ", .{});
        for (event[2].Array) |a| {
            std.debug.print("{}", .{a});
        }
        std.debug.print("\n", .{});
    }

    fn call_api(self: *Self, event: []const msgpack.Value) !void {
        // Work around issue #4639 by storing opts in a variable
        comptime const opts = std.builtin.CallOptions{};

        // For each command in the incoming stream, try to match
        // it against a local api_XYZ declaration.
        for (event[2].Array) |cmd| {
            var matched = false;
            const api_name = cmd.Array[0].RawString;
            inline for (@typeInfo(Self).Struct.decls) |s| {
                // This conditional should be optimized out, since
                // it's known at comptime.
                comptime const is_api = std.mem.startsWith(u8, s.name, "api_");
                if (is_api) {
                    if (std.mem.eql(u8, api_name, s.name[4..])) {
                        for (cmd.Array[1..]) |v| {
                            @call(
                                opts,
                                @field(Self, s.name),
                                .{ self, v.Array },
                            );
                        }
                        matched = true;
                        break;
                    }
                }
            }
            if (!matched) {
                std.debug.warn("[Tui] Unimplemented API: {}\n", .{api_name});
            }
        }
    }

    pub fn tick(self: *Self) !bool {
        while (self.rpc.get_event()) |event| {
            defer self.rpc.release(event);
            if (event == .Int) {
                return false;
            }

            // Methods are called on Ext objects (buffers, windows, etc)
            if (event.Array[2].Array[0] == .Ext) {
                try self.call_method(event.Array);
            }
            // We attach a few autocommands to rpcnotify(0, 'Fp', ...), which
            // are handled here.
            else if (std.mem.eql(u8, "Fp", event.Array[1].RawString)) {
                try self.call_fp(event.Array);
            }
            // Otherwise, we compare against a list of implemented APIs, by
            // doing a comptime unrolled loop that finds api_XYZ functions
            // and compares against them by name.
            else {
                try self.call_api(event.Array);
            }
        }

        if (self.uniforms_changed) {
            self.uniforms_changed = false;
            self.renderer.update_uniforms(&self.u);
        }
        self.renderer.redraw(self.total_tiles);
        return true;
    }

    pub fn run(self: *Self) !void {
        while (!self.window.should_close() and (try self.tick())) {
            c.glfwWaitEvents();
        }

        // Halt the subprocess, then clean out any remaining items in the queue
        _ = try self.rpc.halt(); // Ignore return code
    }

    pub fn update_size(self: *Self, width: c_int, height: c_int) void {
        self.u.width_px = @intCast(u32, width);
        self.u.height_px = @intCast(u32, height);

        const density = self.u.width_px / self.window.get_window_width();
        if (density != self.pixel_density) {
            self.pixel_density = density;

            self.font.deinit();
            self.font = ft.build_atlas(
                self.alloc,
                FONT_NAME,
                FONT_SIZE * self.pixel_density,
                512,
            ) catch |err| {
                std.debug.panic("Could not rebuild font: {}\n", .{err});
            };
            self.u.font = self.font.u;
            self.renderer.update_font_tex(&self.font);
        }

        const cursor_x = self.char_grid[self.total_tiles];
        const cursor_y = self.char_grid[self.total_tiles + 1];

        self.x_tiles = self.u.width_px / self.u.font.glyph_advance / 2;
        self.y_tiles = self.u.height_px / self.u.font.glyph_height;
        self.total_tiles = self.x_tiles * self.y_tiles;

        self.renderer.resize_swap_chain(self.u.width_px, self.u.height_px);
        self.renderer.update_uniforms(&self.u);

        const reply = self.rpc.call(
            "nvim_ui_try_resize",
            .{ self.x_tiles, self.y_tiles },
        ) catch |err| {
            std.debug.panic("Failed to resize UI: {}\n", .{err});
        };
        defer self.rpc.release(reply);

        self.char_grid[self.total_tiles] = cursor_x;
        self.char_grid[self.total_tiles + 1] = cursor_y;

        const r = self.tick() catch |err| {
            std.debug.panic("Failed to tick: {}\n", .{err});
        };

        // Resizing the window shouldn't ever cause the nvim process to exit
        std.debug.assert(r);
    }

    fn get_ascii_lower(key: c_int) ?u8 {
        if (key >= 1 and key <= 127) {
            const char = @intCast(u8, key);
            if (char >= 'A' and char <= 'Z') {
                return char + ('a' - 'A');
            } else {
                return char;
            }
        }
        return null;
    }

    fn get_ascii(key: c_int, mods: c_int) ?u8 {
        if (get_ascii_lower(key)) |char| {
            return if ((mods & c.GLFW_MOD_SHIFT) != 0) to_upper(char) else char;
        }
        return null;
    }

    fn to_upper(key: u8) u8 {
        // This assumes a US-EN keyboard
        return switch (key) {
            'a'...'z' => key - ('a' - 'A'),
            '`' => '~',
            '1' => '!',
            '2' => '@',
            '3' => '#',
            '4' => '$',
            '5' => '%',
            '6' => '^',
            '7' => '&',
            '8' => '*',
            '9' => '(',
            '0' => ')',
            '-' => '_',
            '=' => '+',
            '[' => '{',
            ']' => '}',
            '\\' => '|',
            ';' => ':',
            '\'' => '"',
            ',' => '<',
            '.' => '>',
            '/' => '?',
            else => key,
        };
    }

    fn get_encoded(key: c_int) ?([]const u8) {
        return switch (key) {
            c.GLFW_KEY_ENTER => "Enter",
            c.GLFW_KEY_ESCAPE => "Esc",
            c.GLFW_KEY_TAB => "Tab",
            c.GLFW_KEY_BACKSPACE => "BS",
            c.GLFW_KEY_INSERT => "Insert",
            c.GLFW_KEY_DELETE => "Del",
            c.GLFW_KEY_RIGHT => "Right",
            c.GLFW_KEY_LEFT => "Left",
            c.GLFW_KEY_DOWN => "Down",
            c.GLFW_KEY_UP => "Up",
            c.GLFW_KEY_PAGE_UP => "PageUp",
            c.GLFW_KEY_PAGE_DOWN => "PageDown",
            c.GLFW_KEY_HOME => "Home",
            c.GLFW_KEY_END => "End",

            c.GLFW_KEY_F1 => "F1",
            c.GLFW_KEY_F2 => "F2",
            c.GLFW_KEY_F3 => "F3",
            c.GLFW_KEY_F4 => "F4",
            c.GLFW_KEY_F5 => "F5",
            c.GLFW_KEY_F6 => "F6",
            c.GLFW_KEY_F7 => "F7",
            c.GLFW_KEY_F8 => "F8",
            c.GLFW_KEY_F9 => "F9",
            c.GLFW_KEY_F10 => "F10",
            c.GLFW_KEY_F11 => "F11",
            c.GLFW_KEY_F12 => "F12",

            c.GLFW_KEY_KP_0 => "k0",
            c.GLFW_KEY_KP_1 => "k1",
            c.GLFW_KEY_KP_2 => "k2",
            c.GLFW_KEY_KP_3 => "k3",
            c.GLFW_KEY_KP_4 => "k4",
            c.GLFW_KEY_KP_5 => "k5",
            c.GLFW_KEY_KP_6 => "k6",
            c.GLFW_KEY_KP_7 => "k7",
            c.GLFW_KEY_KP_8 => "k8",
            c.GLFW_KEY_KP_9 => "k9",
            c.GLFW_KEY_KP_DECIMAL => "kPoint",
            c.GLFW_KEY_KP_DIVIDE => "kDivide",
            c.GLFW_KEY_KP_MULTIPLY => "kMultiply",
            c.GLFW_KEY_KP_SUBTRACT => "kSubtract",
            c.GLFW_KEY_KP_ADD => "kAdd",
            c.GLFW_KEY_KP_ENTER => "kEnter",
            c.GLFW_KEY_KP_EQUAL => "kEqual",

            else => null,
        };
    }

    fn skip_key(key: c_int) bool {
        return switch (key) {
            c.GLFW_KEY_LEFT_SHIFT,
            c.GLFW_KEY_LEFT_CONTROL,
            c.GLFW_KEY_LEFT_ALT,
            c.GLFW_KEY_LEFT_SUPER,
            c.GLFW_KEY_RIGHT_SHIFT,
            c.GLFW_KEY_RIGHT_CONTROL,
            c.GLFW_KEY_RIGHT_ALT,
            c.GLFW_KEY_RIGHT_SUPER,
            => true,
            else => false,
        };
    }

    // Helper function to convert a mod bitfield into a string
    // alloc must be an arena allocator, for ease of memory management
    fn encode_mods(alloc: *std.mem.Allocator, mods: c_int) ![]const u8 {
        var out = try std.fmt.allocPrint(alloc, "", .{});
        std.debug.assert(out.len == 0);

        if ((mods & c.GLFW_MOD_SHIFT) != 0) {
            out = try std.fmt.allocPrint(alloc, "S-{}", .{out});
        }
        if ((mods & c.GLFW_MOD_CONTROL) != 0) {
            out = try std.fmt.allocPrint(alloc, "C-{}", .{out});
        }
        if ((mods & c.GLFW_MOD_ALT) != 0) {
            out = try std.fmt.allocPrint(alloc, "A-{}", .{out});
        }
        if ((mods & c.GLFW_MOD_ALT) != 0) {
            out = try std.fmt.allocPrint(alloc, "D-{}", .{out});
        }
        return out;
    }

    pub fn on_key(self: *Self, key: c_int, mods: c_int) !void {
        var arena = std.heap.ArenaAllocator.init(self.alloc);
        var alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        var char_str = [1]u8{0};
        var str: ?[]const u8 = null;

        if (skip_key(key)) {
            // Nothing to do here
        } else if (get_ascii(key, mods)) |char| {
            if (char == '<') {
                str = "<LT>";
            } else {
                char_str[0] = char;
                str = &char_str;
            }

            const mods_ = mods & (~@intCast(c_int, c.GLFW_MOD_SHIFT));
            if (mods_ != 0) {
                const mod_str = try encode_mods(alloc, mods_);
                std.debug.assert(mod_str.len != 0);
                str = try std.fmt.allocPrint(alloc, "<{}{}>", .{ mod_str, str });
            }
        } else if (get_encoded(key)) |enc| {
            if (mods == 0) {
                str = try std.fmt.allocPrint(alloc, "<{}>", .{enc});
            } else {
                const mod_str = try encode_mods(alloc, mods);
                str = try std.fmt.allocPrint(alloc, "<{}{}>", .{ mod_str, enc });
            }
        } else {
            std.debug.print("Got unknown key {} {}\n", .{ key, mods });
        }

        if (str) |s| {
            const bin = msgpack.Value{ .RawString = s };
            var bin_arr = [1]msgpack.Value{bin};
            const arr = msgpack.Value{ .Array = &bin_arr };
            const reply = self.rpc.call("nvim_input", arr) catch |err| {
                std.debug.panic("Failed to call nvim_input: {}", .{err});
            };
            defer self.rpc.release(reply);
        }
    }

    pub fn on_mouse_pos(self: *Self, x: f64, y: f64) !void {
        self.mouse_tile_x = @floatToInt(i32, @intToFloat(f64, self.pixel_density) * x / @intToFloat(f64, self.u.font.glyph_advance));
        self.mouse_tile_y = @floatToInt(i32, @intToFloat(f64, self.pixel_density) * y / @intToFloat(f64, self.u.font.glyph_height));
    }

    pub fn on_scroll(self: *Self, dx: f64, dy: f64) !void {
        // Reset accumulator if we've changed directions
        if (self.mouse_scroll_y != 0 and std.math.signbit(dy) != std.math.signbit(self.mouse_scroll_y)) {
            self.mouse_scroll_y = 0;
        }
        self.mouse_scroll_y += dy;
        while (std.math.absFloat(self.mouse_scroll_y) >= SCROLL_THRESHOLD) {
            const dir = if (self.mouse_scroll_y > 0) "up" else "down";
            if (self.mouse_scroll_y > 0) {
                self.mouse_scroll_y -= SCROLL_THRESHOLD;
            } else {
                self.mouse_scroll_y += SCROLL_THRESHOLD;
            }
            const reply = self.rpc.call("nvim_input_mouse", .{
                "wheel",
                dir,
                "", // mods
                0, // grid
                self.mouse_tile_y, // row
                self.mouse_tile_x, // col
            }) catch |err| {
                std.debug.panic("Failed to call nvim_input_mouse: {}", .{err});
            };
            self.rpc.release(reply);
        }
    }

    pub fn on_mouse_button(self: *Self, button: c_int, action: c_int, mods: c_int) !void {
        var arena = std.heap.ArenaAllocator.init(self.alloc);
        var alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        const button_str = switch (button) {
            c.GLFW_MOUSE_BUTTON_LEFT => "left",
            c.GLFW_MOUSE_BUTTON_RIGHT => "right",
            c.GLFW_MOUSE_BUTTON_MIDDLE => "middle",
            else => |b| {
                std.debug.warn("Ignoring unknown mouse: {}\n", .{b});
                return;
            },
        };

        const action_str = switch (action) {
            c.GLFW_PRESS => "press",
            c.GLFW_RELEASE => "release",
            else => |b| std.debug.panic("Invalid mouse action: {}\n", .{b}),
        };

        const mods_str = try encode_mods(alloc, mods);
        const reply = self.rpc.call("nvim_input_mouse", .{
            button_str,
            action_str,
            mods_str,
            0, // grid
            self.mouse_tile_y, // row
            self.mouse_tile_x, // col
        }) catch |err| {
            std.debug.panic("Failed to call nvim_input_mouse: {}", .{err});
        };
        defer self.rpc.release(reply);
    }
};

export fn size_cb(w: ?*c.GLFWwindow, width: c_int, height: c_int) void {
    const ptr = c.glfwGetWindowUserPointer(w) orelse std.debug.panic("Missing user pointer", .{});
    var tui = @ptrCast(*Tui, @alignCast(8, ptr));
    tui.update_size(width, height);
}

export fn key_cb(w: ?*c.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) void {
    const ptr = c.glfwGetWindowUserPointer(w) orelse std.debug.panic("Missing user pointer", .{});
    var tui = @ptrCast(*Tui, @alignCast(8, ptr));
    if (action == c.GLFW_PRESS or action == c.GLFW_REPEAT) {
        tui.on_key(key, mods) catch |err| {
            std.debug.panic("Failed on_key: {}\n", .{err});
        };
    }
}

export fn mouse_pos_cb(w: ?*c.GLFWwindow, x: f64, y: f64) void {
    const ptr = c.glfwGetWindowUserPointer(w) orelse std.debug.panic("Missing user pointer", .{});
    var tui = @ptrCast(*Tui, @alignCast(8, ptr));
    tui.on_mouse_pos(x, y) catch |err| {
        std.debug.print("Failed on_mouse_pos: {}\n", .{err});
    };
}

export fn mouse_button_cb(w: ?*c.GLFWwindow, button: c_int, action: c_int, mods: c_int) void {
    const ptr = c.glfwGetWindowUserPointer(w) orelse std.debug.panic("Missing user pointer", .{});
    var tui = @ptrCast(*Tui, @alignCast(8, ptr));
    tui.on_mouse_button(button, action, mods) catch |err| {
        std.debug.print("Failed on_mouse_button: {}\n", .{err});
    };
}

export fn scroll_cb(w: ?*c.GLFWwindow, dx: f64, dy: f64) void {
    const ptr = c.glfwGetWindowUserPointer(w) orelse std.debug.panic("Missing user pointer", .{});
    var tui = @ptrCast(*Tui, @alignCast(8, ptr));
    tui.on_scroll(dx, dy) catch |err| {
        std.debug.print("Failed on_scroll: {}\n", .{err});
    };
}

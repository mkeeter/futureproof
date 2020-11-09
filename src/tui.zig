const std = @import("std");

const c = @import("c.zig");
const ft = @import("ft.zig");
const msgpack = @import("msgpack.zig");

const Renderer = @import("renderer.zig").Renderer;
const RPC = @import("rpc.zig").RPC;
const Window = @import("window.zig").Window;

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

    char_grid: [512 * 512]u32,

    //  Render state to pass into WGPU
    u: c.fpUniforms,

    pub fn deinit(self: *Tui) void {
        self.rpc.deinit();
        self.alloc.destroy(self);
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
            tmp_alloc,
            "font/Inconsolata-Regular.ttf",
            40,
            512,
        );
        const renderer = try Renderer.init(tmp_alloc, window.window, &font);

        const x_tiles = @intCast(u32, width) / font.u.glyph_advance;
        const y_tiles = @intCast(u32, height) / font.u.glyph_height;

        // Start up the RPC subprocess, using the global allocator
        const nvim_cmd = [_][]const u8{ "nvim", "--embed" };
        var rpc = try RPC.init(&nvim_cmd, alloc);

        const out = try alloc.create(Tui);
        out.* = Tui{
            .alloc = alloc,

            .window = window,
            .renderer = renderer,
            .rpc = rpc,

            .char_grid = undefined,

            .u = c.fpUniforms{
                .width_px = @intCast(u32, width),
                .height_px = @intCast(u32, height),
                .font = font.u,
            },
        };
        window.set_callbacks(size_cb, key_cb, @ptrCast(?*c_void, out));

        // Attach the UI via RPC
        var options = msgpack.KeyValueMap.init(alloc);
        try options.put(
            msgpack.Key{ .RawString = "ext_linegrid" },
            msgpack.Value{ .Boolean = true },
        );
        defer options.deinit();
        const reply = try rpc.call("nvim_ui_attach", .{ x_tiles, y_tiles, options });
        defer reply.destroy(alloc);

        out.update_size(width, height);

        return out;
    }

    pub fn tick(self: *Self) !void {
        const x_tiles = self.u.width_px / self.u.font.glyph_advance;
        const y_tiles = self.u.height_px / self.u.font.glyph_height;
        const total_tiles = x_tiles * y_tiles;

        while (self.rpc.get_event()) |event| {
            for (event.Array[2].Array) |cmd| {
                if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_line")) {
                    for (cmd.Array[1..]) |v| {
                        const line = v.Array;
                        const grid = line[0].UInt;
                        const row = line[1].UInt;
                        var col = line[2].UInt;
                        std.debug.print("Printing at {} {}\n    '", .{ row, col });
                        for (line[3].Array) |cell_| {
                            const cell = cell_.Array;
                            const text = cell[0].RawString;
                            const repeat = if (cell.len >= 3) cell[2].UInt else 1;
                            std.debug.print("{} {}\t", .{ text, repeat });
                            std.debug.assert(text.len == 1);
                            var i: usize = 0;
                            while (i < repeat) : (i += 1) {
                                self.char_grid[col + row * x_tiles] = text[0];
                                col += 1; // TODO: unicode?!
                            }
                        }
                        std.debug.print("'\n", .{});
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_scroll")) {
                    for (cmd.Array[1..]) |v| {
                        const line = v.Array;
                        const grid = line[0].UInt;
                        const top = @intCast(i32, line[1].UInt);
                        const bot = @intCast(i32, line[2].UInt);
                        const left = line[3].UInt;
                        const right = line[4].UInt;
                        const rows = @intCast(i32, line[5].UInt);
                        const cols = line[6].UInt;
                        std.debug.assert(cols == 0);

                        var y: i32 = if (rows > 0) (bot - rows) else (top + rows - 1);
                        var dy: i32 = if (rows > 0) 1 else -1;
                        var y_final: i32 = if (rows > 0) bot else (top - 1);
                        while (y != y_final) : (y += dy) {
                            var x = left;
                            const y_src = @intCast(u32, y);
                            const y_dst = @intCast(u32, y - rows);
                            while (x < right) : (x += 1) {
                                const char = self.char_grid[x + y_src * x_tiles];
                                self.char_grid[x + y_dst * x_tiles] = char;
                            }
                        }
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "flush")) {
                    self.renderer.update_grid(self.char_grid[0..total_tiles]);
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_clear")) {
                    std.mem.set(u32, self.char_grid[0..], 0);
                } else {
                    std.debug.print("Unimplemented: {}\n", .{cmd.Array[0]});
                }
            }
            try self.rpc.release_event(event);
        }

        self.renderer.redraw(total_tiles);
    }

    pub fn run(self: *Self) !void {
        while (!self.window.should_close()) {
            try self.tick();
            c.glfwWaitEvents();
        }

        // Halt the subprocess, then clean out any remaining items in the queue
        _ = try self.rpc.halt(); // Ignore return code
    }

    pub fn update_size(self: *Self, width: c_int, height: c_int) void {
        self.u.width_px = @intCast(u32, width);
        self.u.height_px = @intCast(u32, height);

        self.renderer.resize_swap_chain(self.u.width_px, self.u.height_px);
        self.renderer.update_uniforms(&self.u);

        const x_tiles = self.u.width_px / self.u.font.glyph_advance;
        const y_tiles = self.u.height_px / self.u.font.glyph_height;
        const reply = self.rpc.call("nvim_ui_try_resize", .{ x_tiles, y_tiles }) catch |err| {
            std.debug.panic("Failed to resize UI: {}\n", .{err});
        };
        defer reply.destroy(self.alloc);

        self.tick() catch |err| {
            std.debug.panic("Failed to tick: {}\n", .{err});
        };
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
            c.GLFW_KEY_ENTER => "<Enter>",
            c.GLFW_KEY_ESCAPE => "<Esc>",
            c.GLFW_KEY_TAB => "<Tab>",
            c.GLFW_KEY_BACKSPACE => "<BS>",
            c.GLFW_KEY_INSERT => "<Insert>",
            c.GLFW_KEY_DELETE => "<Del>",
            c.GLFW_KEY_RIGHT => "<Right>",
            c.GLFW_KEY_LEFT => "<Left>",
            c.GLFW_KEY_DOWN => "<Down>",
            c.GLFW_KEY_UP => "<Up>",
            c.GLFW_KEY_PAGE_UP => "<PageUp>",
            c.GLFW_KEY_PAGE_DOWN => "<PageDown>",
            c.GLFW_KEY_HOME => "<Home>",
            c.GLFW_KEY_END => "<End>",

            c.GLFW_KEY_F1 => "<F1>",
            c.GLFW_KEY_F2 => "<F2>",
            c.GLFW_KEY_F3 => "<F3>",
            c.GLFW_KEY_F4 => "<F4>",
            c.GLFW_KEY_F5 => "<F5>",
            c.GLFW_KEY_F6 => "<F6>",
            c.GLFW_KEY_F7 => "<F7>",
            c.GLFW_KEY_F8 => "<F8>",
            c.GLFW_KEY_F9 => "<F9>",
            c.GLFW_KEY_F10 => "<F10>",
            c.GLFW_KEY_F11 => "<F11>",
            c.GLFW_KEY_F12 => "<F12>",

            c.GLFW_KEY_KP_0 => "<k0>",
            c.GLFW_KEY_KP_1 => "<k1>",
            c.GLFW_KEY_KP_2 => "<k2>",
            c.GLFW_KEY_KP_3 => "<k3>",
            c.GLFW_KEY_KP_4 => "<k4>",
            c.GLFW_KEY_KP_5 => "<k5>",
            c.GLFW_KEY_KP_6 => "<k6>",
            c.GLFW_KEY_KP_7 => "<k7>",
            c.GLFW_KEY_KP_8 => "<k8>",
            c.GLFW_KEY_KP_9 => "<k9>",
            c.GLFW_KEY_KP_DECIMAL => "<kPoint>",
            c.GLFW_KEY_KP_DIVIDE => "<kDivide>",
            c.GLFW_KEY_KP_MULTIPLY => "<kMultiply>",
            c.GLFW_KEY_KP_SUBTRACT => "<kSubtract>",
            c.GLFW_KEY_KP_ADD => "<kAdd>",
            c.GLFW_KEY_KP_ENTER => "<kEnter>",
            c.GLFW_KEY_KP_EQUAL => "<kEqual>",

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

    pub fn on_key(self: *Self, key: c_int, mods: c_int) void {
        var arena = std.heap.ArenaAllocator.init(self.alloc);
        var alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        var char_str = [1]u8{0};
        var str: ?[]const u8 = null;

        if (skip_key(key)) {
            // Nothing to do here
        } else if (get_ascii(key, mods)) |char| {
            if ((mods & (~@intCast(c_int, c.GLFW_MOD_SHIFT))) == 0) {
                char_str[0] = char;
                str = &char_str;
            } else {
                std.debug.print("Cannot handle mods yet", .{});
            }
        } else if (get_encoded(key)) |enc| {
            if (mods == 0) {
                str = enc;
            } else {
                std.debug.print("Cannot handle mods yet", .{});
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
            defer reply.destroy(self.rpc.alloc);
        }
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
        tui.on_key(key, mods);
    }
}

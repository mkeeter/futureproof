const std = @import("std");

const c = @import("c.zig");
const msgpack = @import("msgpack.zig");
const blocking_queue = @import("blocking_queue.zig");
const rpc = @import("rpc.zig");
const window = @import("window.zig");

export fn size_cb(w: ?*c.GLFWwindow, width: c_int, height: c_int) void {
    // TODO: redraw here, so that it scales with redraw
    // assign with     _ = c.glfwSetWindowSizeCallback(window, size_cb);
}

pub fn main() anyerror!void {
    const alloc = std.heap.c_allocator;

    const nvim_cmd = [_][]const u8{
        "./vendor/neovim/build/bin/nvim", "--embed",
    };
    var nvim = try rpc.RPC.init(&nvim_cmd, alloc);
    var options = msgpack.KeyValueMap.init(alloc);
    try options.put(
        msgpack.Key{ .RawString = "ext_linegrid" },
        msgpack.Value{ .Boolean = true },
    );
    const reply = try nvim.call("nvim_ui_attach", .{ 60, 60, options });
    std.debug.print("reply: .{}\n", .{reply});

    if (c.glfwInit() != c.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    var w = try window.Window.init(640, 480, "futureproof");
    defer w.deinit();

    var cursor_x: u32 = 0;
    var cursor_y: u32 = 0;
    var char_grid: [512 * 512]u32 = undefined;
    std.mem.set(u32, char_grid[0..], 0);

    while (!w.should_close()) {
        w.check_size();
        w.redraw();

        while (nvim.listener.event_queue.try_get()) |event| {
            for (event.Array[2].Array) |cmd| {
                if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_line")) {
                    for (cmd.Array[1..]) |v| {
                        const line = v.Array;
                        const grid = line[0].UInt;
                        const row = line[1].UInt;
                        const col_start = line[2].UInt;
                        for (line[3].Array) |cell_| {
                            const cell = cell_.Array;
                            const text = cell[0].RawString;
                            const repeat = if (cell.len >= 2) cell[1].UInt else 1;
                            std.debug.assert(text.len == 1);
                            var i: usize = 0;
                            while (i < repeat) : (i += 1) {
                                char_grid[cursor_x + cursor_y * w.x_tiles] = text[0];
                                cursor_x += 1; // TODO: unicode?!
                            }
                        }
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "flush")) {
                    w.update_grid(char_grid[0..w.total_tiles]);
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_clear")) {
                    std.mem.set(u32, char_grid[0..], 0);
                } else {
                    std.debug.print("Unimplemented: {}\n", .{cmd.Array[0]});
                }
            }
        }

        c.glfwWaitEvents();
    }
}

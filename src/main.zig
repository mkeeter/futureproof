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
    const reply = try nvim.call("nvim_ui_attach", .{ 80, 80, msgpack.KeyValueMap.init(alloc) });
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
                std.debug.print("Got cmd .{}\n", .{cmd.Array[0]});
                if (std.mem.eql(u8, cmd.Array[0].RawString, "cursor_goto")) {
                    std.debug.assert(cmd.Array.len == 2);
                    cursor_x = @intCast(u32, cmd.Array[1].Array[0].UInt);
                    cursor_y = @intCast(u32, cmd.Array[1].Array[1].UInt);
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "put")) {
                    for (cmd.Array[1..]) |v| {
                        for (v.Array) |u| {
                            for (u.RawString) |char| {
                                char_grid[cursor_x + cursor_y * w.x_tiles] = char;
                                cursor_x += 1; // TODO: unicode?!
                            }
                        }
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "flush")) {
                    w.update_grid(char_grid[0..w.total_tiles]);
                }
            }
        }

        c.glfwWaitEvents();
    }
}

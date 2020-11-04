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

    while (!w.should_close()) {
        w.check_size();
        w.redraw();

        if (nvim.listener.event_queue.try_get()) |event| {
            std.debug.print("Got event .{}\n", .{event});
        }

        c.glfwWaitEvents();
    }
}

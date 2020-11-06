const std = @import("std");

const c = @import("c.zig");
const msgpack = @import("msgpack.zig");
const Tui = @import("tui.zig").Tui;

pub fn main() anyerror!void {
    var gp_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.testing.expect(!gp_alloc.deinit());
    const alloc: *std.mem.Allocator = &gp_alloc.allocator;

    if (c.glfwInit() != c.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    var tui = try Tui.init(alloc);
    defer tui.deinit();

    // Attach the remote UI (TODO: move this to tui.zig)
    var options = msgpack.KeyValueMap.init(alloc);
    try options.put(
        msgpack.Key{ .RawString = "ext_linegrid" },
        msgpack.Value{ .Boolean = true },
    );
    defer options.deinit();
    const reply = try tui.rpc.call("nvim_ui_attach", .{ 1, 1, options });
    defer reply.destroy(alloc);
    std.debug.print("reply: .{}\n", .{reply});

    try tui.run();
}

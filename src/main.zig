const std = @import("std");

const c = @import("c.zig");
const msgpack = @import("msgpack.zig");
const Tui = @import("tui.zig").Tui;

pub fn main() anyerror!void {
    var gp_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gp_alloc.deinit();
    const alloc: *std.mem.Allocator = &gp_alloc.allocator;

    if (c.glfwInit() != c.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    var tui = try Tui.init(alloc);
    defer tui.deinit();

    try tui.run();
}

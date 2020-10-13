const std = @import("std");
const glfw3 = @cImport({
    @cInclude("GLFW/glfw3.h");
});

pub fn main() anyerror!void {
    std.debug.print("HELLO {}", glfw3);
    std.debug.warn("All your codebase are belong to us.\n", .{});
}

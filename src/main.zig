const std = @import("std");
const glfw = @cImport({
    @cInclude("GLFW/glfw3.h");
});

pub fn main() anyerror!void {
    if (glfw.glfwInit() != glfw.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    const window = glfw.glfwCreateWindow(640, 480, "hello", null, null);
    defer glfw.glfwDestroyWindow(window);
    if (window == null) {
        var err_str: [*c]u8 = null;
        const err = glfw.glfwGetError(&err_str);
        std.debug.panic("Failed to open window: {} ({})", .{ err, err_str });
    }

    glfw.glfwMakeContextCurrent(window);
    while (glfw.glfwWindowShouldClose(window) == 0) {
        glfw.glfwWaitEvents();
    }
}

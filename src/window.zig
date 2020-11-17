const std = @import("std");

const c = @import("c.zig");

pub const Window = struct {
    const Self = @This();

    window: *c.GLFWwindow,

    pub fn init(width: c_int, height: c_int, name: [*c]const u8) !Self {
        const window = c.glfwCreateWindow(width, height, name, null, null);

        // Open the window!
        if (window) |w| {
            return Window{ .window = w };
        } else {
            var err_str: [*c]u8 = null;
            const err = c.glfwGetError(&err_str);
            std.debug.panic("Failed to open window: {} ({})", .{ err, err_str });
        }
    }

    pub fn should_close(self: *Self) bool {
        return c.glfwWindowShouldClose(self.window) != 0;
    }

    pub fn get_window_width(self: *Self) u32 {
        var w_width: c_int = undefined;
        c.glfwGetWindowSize(self.window, &w_width, null);
        return @intCast(u32, w_width);
    }

    pub fn set_callbacks(
        self: *Self,
        size_cb: c.GLFWframebuffersizefun,
        key_cb: c.GLFWkeyfun,
        data: ?*c_void,
    ) void {
        _ = c.glfwSetWindowUserPointer(self.window, data);
        _ = c.glfwSetFramebufferSizeCallback(self.window, size_cb);
        _ = c.glfwSetKeyCallback(self.window, key_cb);
    }
};

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
            std.debug.panic("Failed to open window: {any} ({s})", .{ err, err_str });
        }
    }

    pub fn deinit(self: *Self) void {
        c.glfwDestroyWindow(self.window);
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
        mouse_button_cb: c.GLFWmousebuttonfun,
        mouse_pos_cb: c.GLFWcursorposfun,
        scroll_cb: c.GLFWscrollfun,
        data: ?*anyopaque,
    ) void {
        // Attach the TUI handle to the window so we can extract it
        _ = c.glfwSetWindowUserPointer(self.window, data);

        // Resizing the window
        _ = c.glfwSetFramebufferSizeCallback(self.window, size_cb);

        // User input
        _ = c.glfwSetKeyCallback(self.window, key_cb);
        _ = c.glfwSetMouseButtonCallback(self.window, mouse_button_cb);
        _ = c.glfwSetCursorPosCallback(self.window, mouse_pos_cb);
        _ = c.glfwSetScrollCallback(self.window, scroll_cb);
    }
};

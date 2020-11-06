const c = @import("c");

pub const Window = struct {
    const Self = @This();

    window: *c.GLFWwindow,
    width: c_int,
    height: c_int,

    fn init() !Self {
        const window = c.glfwCreateWindow(640, 480, "futureproof", null, null);
        // Open the window!
        if (window == null) {
            var err_str: [*c]u8 = null;
            const err = c.glfwGetError(&err_str);
            std.debug.panic("Failed to open window: {} ({})", .{ err, err_str });
        }
    }
};

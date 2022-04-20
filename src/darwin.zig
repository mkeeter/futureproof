// extern definitions that are specific to macOS

const c = @import("c.zig");

// Normally, this would be declared in "GLFW/glfw3native.h" after defining
// GLFW_EXPOSE_NATIVE_COCOA.  However, for mysterious reasons, this header
// can't be included (https://github.com/Homebrew/homebrew-core/issues/44579)
pub extern fn glfwGetCocoaWindow(window: ?*c.GLFWwindow) callconv(.C) ?*anyopaque;

// Trust me, we're linking against AppKit eventually
pub extern const NSPasteboardTypeString: c.id;

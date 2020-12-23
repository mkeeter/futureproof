const builtin = @import("builtin");

pub usingnamespace @cImport({
    // GLFW
    @cInclude("GLFW/glfw3.h");

    // Freetype
    @cInclude("ft2build.h");
    @cInclude("freetype/freetype.h");

    @cInclude("wgpu/wgpu.h");
    @cInclude("shaderc/shaderc.h");

    @cInclude("extern/futureproof.h");
    @cInclude("extern/preview.h");

    if (builtin.os.tag == .macos) {
        @cInclude("objc/message.h");
    }
});

// Normally, this would be declared in "GLFW/glfw3native.h" after defining
// GLFW_EXPOSE_NATIVE_COCOA.  However, for mysterious reasons, this header
// can't be included (https://github.com/Homebrew/homebrew-core/issues/44579)
pub extern fn glfwGetCocoaWindow(window: ?*GLFWwindow) callconv(.C) ?*c_void;

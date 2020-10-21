const builtin = @import("builtin");

pub usingnamespace @cImport({
    // GLFW
    @cInclude("GLFW/glfw3.h");
    if (builtin.os.tag == builtin.Os.Tag.macos) {
        @cDefine("GLFW_EXPOSE_NATIVE_COCOA", {});
    }
    @cInclude("GLFW/glfw3native.h");

    // Freetype
    @cInclude("ft2build.h");
    @cInclude("freetype/freetype.h");

    @cInclude("wgpu/wgpu.h");
    @cInclude("shaderc/shaderc.h");
});

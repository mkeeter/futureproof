const builtin = @import("builtin");
const std = @import("std");
const objc = @import("objc.zig");

const c = @import("c.zig");

// Normally, this would be declared in "GLFW/glfw3native.h" after defining
// GLFW_EXPOSE_NATIVE_COCOA.  However, for mysterious reasons, this header
// can't be included (https://github.com/Homebrew/homebrew-core/issues/44579)
pub extern fn glfwGetCocoaWindow(window: ?*GLFWwindow) callconv(.C) ?*c_void;

// Trust me, we're linking against AppKit eventually
pub extern const NSPasteboardTypeString: id;

pub fn get_clipboard() [*c]u8 {
    const platform = builtin.os.tag;
    if (platform == .macos) {
        const pasteboard_class = objc.class("NSPasteboard");
        const pb = objc.call(pasteboard_class, "generalPasteboard");
        const items = objc.call(pb, "pasteboardItems");

        const item = objc.call_(items, "objectAtIndex:", @as(c_ulong, 0));
        const str = objc.call_(item, "stringForType:", objc.NSPasteboardTypeString);

        return @ptrCast([*c]u8, objc.call(str, "UTF8String"));
    } else {
        std.debug.panic("Unimplemented on platform {}", .{platform});
    }
}

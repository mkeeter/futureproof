const c = @import("c.zig");

pub fn class(s: [*c]const u8) c.id {
    return @ptrCast(c.id, c.objc_lookUpClass(s));
}

pub fn call(obj: c.id, sel_name: [*c]const u8) c.id {
    var f = @ptrCast(
        fn (c.id, c.SEL) callconv(.C) c.id,
        c.objc_msgSend,
    );
    return f(obj, c.sel_getUid(sel_name));
}

pub fn call_(obj: c.id, sel_name: [*c]const u8, arg: anytype) c.id {
    //  objc_msgSend has the prototype "void objc_msgSend(void)",
    //  so we have to cast it based on the types of our arguments
    //  (https://www.mikeash.com/pyblog/objc_msgsends-new-prototype.html)
    var f = @ptrCast(
        fn (c.id, c.SEL, @TypeOf(arg)) callconv(.C) c.id,
        c.objc_msgSend,
    );
    return f(obj, c.sel_getUid(sel_name), arg);
}

// Normally, this would be declared in "GLFW/glfw3native.h" after defining
// GLFW_EXPOSE_NATIVE_COCOA.  However, for mysterious reasons, this header
// can't be included (https://github.com/Homebrew/homebrew-core/issues/44579)
pub extern fn glfwGetCocoaWindow(window: ?*c.GLFWwindow) callconv(.C) ?*c_void;

// Trust me, we're linking against AppKit eventually
pub extern const NSPasteboardTypeString: c.id;

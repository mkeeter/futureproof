const builtin = @import("builtin");
const std = @import("std");

const c = @import("c.zig");

pub fn get_clipboard() [*c]u8 {
    const platform = builtin.os.tag;
    if (platform == .macos) {
        const pasteboard_class = @ptrCast(c.id, c.objc_lookUpClass("NSPasteboard"));
        const generalPasteboard = c.sel_getUid("generalPasteboard");
        var call_sel = @ptrCast(
            fn (c.id, c.SEL) callconv(.C) c.id,
            c.objc_msgSend,
        );
        const pb = call_sel(pasteboard_class, generalPasteboard);
        const items = call_sel(pb, c.sel_getUid("pasteboardItems"));

        var call_sel_ulong = @ptrCast(
            fn (c.id, c.SEL, c_ulong) callconv(.C) c.id,
            c.objc_msgSend,
        );
        const item = call_sel_ulong(items, c.sel_getUid("objectAtIndex:"), 0);

        var call_sel_obj = @ptrCast(
            fn (c.id, c.SEL, c.id) callconv(.C) c.id,
            c.objc_msgSend,
        );

        const str = call_sel_obj(
            item,
            c.sel_getUid("stringForType:"),
            c.NSPasteboardTypeString,
        );

        return @ptrCast([*c]u8, call_sel(str, c.sel_getUid("UTF8String")));
    } else {
        std.debug.panic("Unimplemented on platform {}", .{platform});
    }
}

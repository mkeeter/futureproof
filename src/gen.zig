const std = @import("std");
const msgpack = @import("msgpack.zig");

fn k(d: []const u8) msgpack.Key {
    return msgpack.Key{ .RawString = d };
}

pub fn main() anyerror!void {
    const alloc = std.heap.c_allocator;

    const cmd = [_][]const u8{
        "./vendor/neovim/build/bin/nvim", "--api-info",
    };
    const r = try std.ChildProcess.exec(.{
        .allocator = alloc,
        .argv = &cmd,
    });
    const buf = r.stdout;
    const api = (try msgpack.decode(alloc, buf)).data;

    const version = try api.get("version");
    const api_level = (try version.get("api_level")).Int;

    std.debug.print("Got NeoVim API level {}\n", .{api_level});

    const types = try api.get("types");
    std.debug.print("Got types {}\n", .{types.Map.iterator()});
}

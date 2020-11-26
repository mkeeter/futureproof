const std = @import("std");

const msgpack = @import("msgpack.zig");

pub const Buffer = struct {
    const Self = @This();

    alloc: *std.mem.Allocator,

    pub fn init(alloc: *std.mem.Allocator) Self {
        return .{ .alloc = alloc };
    }

    pub fn deinit(self: *Buffer) void {
        // Nothing to do here yet
    }

    pub fn rpc_method(self: *Buffer, name: []const u8, args: []const msgpack.Value) void {
        std.debug.print("Buffer: unimplemented method {}\n", .{name});
    }
};

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

    pub fn api_changedtick_event(self: *Buffer, args: []const msgpack.Value) void {
        std.debug.print("changedtick_event\n   ", .{});
        for (args) |a| {
            std.debug.print("{} ", .{a});
        }
        std.debug.print("\n", .{});
    }

    pub fn rpc_method(self: *Buffer, name: []const u8, args: []const msgpack.Value) void {
        var matched = false;

        // Same trick as in tui.zig
        comptime const opts = std.builtin.CallOptions{};
        inline for (@typeInfo(Self).Struct.decls) |s| {
            // This conditional should be optimized out, since
            // it's known at comptime.
            comptime const is_api = std.mem.startsWith(u8, s.name, "api_");
            if (is_api) {
                // Skip nvim_buf_ in the RPC name and api_ in the API name
                if (std.mem.eql(u8, name[9..], s.name[4..])) {
                    @call(opts, @field(Self, s.name), .{ self, args });
                    matched = true;
                    break;
                }
            }
        }
        if (!matched) {
            std.debug.warn("[Buffer] Unimplemented API: {}\n", .{name});
        }
    }
};

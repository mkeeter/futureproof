const std = @import("std");

const msgpack = @import("msgpack.zig");

pub const Buffer = struct {
    const Self = @This();

    lines: [][]const u8,
    alloc: *std.mem.Allocator,

    pub fn init(alloc: *std.mem.Allocator) !Self {
        const lines = try alloc.alloc([]const u8, 0);
        return Self{
            .lines = lines,
            .alloc = alloc,
        };
    }

    pub fn deinit(self: *Buffer) void {
        for (self.lines) |line| {
            self.alloc.free(line);
        }
        self.alloc.free(self.lines);
    }

    fn api_changedtick_event(self: *Buffer, args: []const msgpack.Value) void {
        std.debug.print("changedtick_event\n   ", .{});
        for (args) |a| {
            std.debug.print("{} ", .{a});
        }
        std.debug.print("\n", .{});
    }

    fn resize_lines_to(self: *Buffer, count: u64) !void {
        std.debug.assert(count > self.lines.len);
        const new_lines = try self.alloc.alloc([]const u8, count);
        var i: u32 = 0;
        while (i < self.lines.len) : (i += 1) {
            new_lines[i] = self.lines[i];
        }
        while (i < new_lines.len) : (i += 1) {
            new_lines[i] = try self.alloc.alloc(u8, 0);
        }
        self.alloc.free(self.lines);
        self.lines = new_lines;
    }

    fn api_lines_event(self: *Buffer, args: []const msgpack.Value) void {
        const first = args[1].UInt;
        const last = args[2].UInt;
        const lines = args[3].Array;

        // Check whether we need to resize to fit all the lines
        const max_line = std.math.max(first, last);
        if (max_line > self.lines.len) {
            self.resize_lines_to(max_line) catch |err| {
                std.debug.panic("Failed to resize lines: {}\n", .{err});
            };
        }

        var i = first;
        while (i < last) : (i += 1) {
            self.alloc.free(self.lines[i]);
            self.lines[i] = lines[i - first].RawString;
            lines[i - first] = .Nil;
        }
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

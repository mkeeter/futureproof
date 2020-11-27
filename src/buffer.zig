const std = @import("std");

const msgpack = @import("msgpack.zig");

pub const Status = enum {
    Okay,
    Changed,
    Done,
};

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

    pub fn to_buf(self: *Buffer) ![]const u8 {
        var total_length: usize = 0;
        for (self.lines) |line| {
            total_length += line.len + 1;
        }
        var out = try self.alloc.alloc(u8, total_length);

        var pos: usize = 0;
        for (self.lines) |line| {
            std.mem.copy(u8, out[pos..(pos + line.len)], line);
            out[pos + line.len] = '\n';
            pos += line.len + 1;
        }
        return out;
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

    fn api_lines_event(self: *Buffer, args: []const msgpack.Value) Status {
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

            // Steal the value from the msgpack array
            self.lines[i] = lines[i - first].RawString;
            lines[i - first] = .Nil;
        }

        return Status.Changed;
    }

    // This API event is the only one which returns 'true', indicating
    // that the buffer should be destroyed
    fn api_detach_event(self: *Buffer, args: []const msgpack.Value) Status {
        return Status.Done;
    }

    pub fn rpc_method(self: *Buffer, name: []const u8, args: []const msgpack.Value) Status {
        // Same trick as in tui.zig
        comptime const opts = std.builtin.CallOptions{};
        inline for (@typeInfo(Self).Struct.decls) |s| {
            // This conditional should be optimized out, since
            // it's known at comptime.
            comptime const is_api = std.mem.startsWith(u8, s.name, "api_");
            if (is_api) {
                // Skip nvim_buf_ in the RPC name and api_ in the API name
                if (std.mem.eql(u8, name[9..], s.name[4..])) {
                    return @call(opts, @field(Self, s.name), .{ self, args });
                }
            }
        }
        std.debug.warn("[Buffer] Unimplemented API: {}\n", .{name});
        return Status.Okay;
    }
};

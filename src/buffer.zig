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
    alloc: std.mem.Allocator,

    pub fn init(alloc: std.mem.Allocator) !Self {
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

    fn api_lines_event(self: *Buffer, args: []const msgpack.Value) !Status {
        // Special-case for the first event after we've attached. which send
        // the full buffer with last == -1
        if (args[2] == .Int) {
            // Check various states to ensure that this is the first event
            std.debug.assert(args[1].UInt == 0);
            std.debug.assert(args[2].Int == -1);
            std.debug.assert(self.lines.len == 0);

            const lines = args[3].Array;
            self.lines = try self.alloc.alloc([]const u8, lines.len);
            var i: u32 = 0;
            while (i < lines.len) : (i += 1) {
                self.lines[i] = lines[i].RawString;
                lines[i] = .Nil;
            }
            return Status.Changed;
        }

        const first = args[1].UInt;
        // Work around buf #13418 in Neovim
        const last = std.math.min(args[2].UInt, self.lines.len);
        std.debug.assert(last >= first);

        const lines = args[3].Array;

        const new_size = self.lines.len + lines.len - (last - first);
        if (new_size != self.lines.len) {
            var new_lines = try self.alloc.alloc([]const u8, new_size);

            // Copy lines from before the region of interest
            var i: u32 = 0;
            var j: u32 = 0;
            while (i < first) : (i += 1) {
                new_lines[i] = self.lines[j];
                j += 1;
            }

            // Copy the modified lines
            while (i - first < lines.len) : (i += 1) {
                new_lines[i] = lines[i - first].RawString;
                lines[i - first] = .Nil;
            }

            // Erase the old region of interest
            while (j < last) : (j += 1) {
                self.alloc.free(self.lines[j]);
            }

            // Copy lines after the region of interest
            while (j < self.lines.len) : (j += 1) {
                new_lines[i] = self.lines[j];
                i += 1;
            }

            self.alloc.free(self.lines);
            self.lines = new_lines;
        } else {
            var i = first;
            while (i < last) : (i += 1) {
                self.alloc.free(self.lines[i]);

                // Steal the value from the msgpack array
                self.lines[i] = lines[i - first].RawString;
                lines[i - first] = .Nil;
            }
        }
        return Status.Changed;
    }

    // This API event is the only one which returns 'true', indicating
    // that the buffer should be destroyed
    fn api_detach_event(self: *Buffer, args: []const msgpack.Value) !Status {
        _ = self;
        _ = args;
        return Status.Done;
    }

    pub fn rpc_method(self: *Buffer, name: []const u8, args: []const msgpack.Value) !Status {
        // Same trick as in tui.zig
        const opts = comptime std.builtin.CallOptions{};
        inline for (@typeInfo(Self).Struct.decls) |s| {
            // This conditional should be optimized out, since
            // it's known at comptime.
            const is_api = comptime std.mem.startsWith(u8, s.name, "api_");
            if (is_api) {
                // Skip nvim_buf_ in the RPC name and api_ in the API name
                if (std.mem.eql(u8, name[9..], s.name[4..])) {
                    return @call(opts, @field(Self, s.name), .{ self, args });
                }
            }
        }
        std.debug.print("[Buffer] Unimplemented API: {s}\n", .{name});
        return Status.Okay;
    }
};

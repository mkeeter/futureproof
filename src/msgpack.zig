const std = @import("std");

const MsgPackError = error{
    InvalidKeyType,
    NoExtensionsAllowed,
    NotAMap,
    NoSuchKey,
};

pub const Key = union(enum) {
    Int: i64,
    UInt: u64,
    Boolean: bool,
    RawString: []const u8,
    RawData: []const u8,

    fn bytes(s: Key) []const u8 {
        return switch (s) {
            .Int, .UInt, .Boolean => std.mem.asBytes(&s),
            .RawString, .RawData => |data| data,
        };
    }

    fn eql(a: Key, b: Key) bool {
        if (@as(@TagType(Key), a) != b) {
            return false;
        } else {
            return std.mem.eql(u8, a.bytes(), b.bytes());
        }
    }

    fn hash(s: Key) u64 {
        return std.hash.Wyhash.hash(0, s.bytes());
    }
};

const KeyValueMap = std.hash_map.HashMap(Key, Value, Key.hash, Key.eql, std.hash_map.DefaultMaxLoadPercentage);

pub const Value = union(enum) {
    Int: i64,
    UInt: u64,
    Nil: void,
    Boolean: bool,
    Float: f64,
    RawString: []u8,
    RawData: []u8,
    Array: []Value,
    Map: KeyValueMap,
    Extension: void, // unimplemented

    pub fn get(self: Value, k: []const u8) !Value {
        switch (self) {
            .Map => |map| {
                const entry = map.getEntry(Key{ .RawString = k });
                if (entry) |e| {
                    return e.value;
                }
                return MsgPackError.NoSuchKey;
            },
            else => return MsgPackError.NotAMap,
        }
    }

    fn to_hash_key(self: Value) !Key {
        return switch (self) {
            .Int => Key{ .Int = self.Int },
            .UInt => Key{ .UInt = self.UInt },
            .Boolean => Key{ .Boolean = self.Boolean },
            .RawString => Key{ .RawString = self.RawString },
            .RawData => Key{ .RawData = self.RawData },
            else => MsgPackError.InvalidKeyType,
        };
    }

    pub fn serialize(self: Value, comptime T: type, out: T) !void {
        switch (self) {
            .Int => |i| {
                switch (i) {
                    0x00...0x7f => _ = try out.write(&std.mem.toBytes(@intCast(i8, i))),
                    0x80...0xff => {
                        _ = try out.writeByte(0xd0);
                        _ = try out.write(&std.mem.toBytes(@intCast(i8, i)));
                    },
                    else => std.debug.panic("invalid int\n", .{}),
                }
            },
            else => std.debug.panic("Not implemented\n", .{}),
        }
        return out.writeByte('a');
    }
};

const Decoded = struct {
    data: Value,
    offset: usize,
};

fn generic_type(comptime T: type) type {
    return struct {
        data: T,
        offset: usize,
    };
}

fn decode_generic(comptime T: type, data: []const u8) !generic_type(T) {
    var out: T = undefined;
    @memcpy(@ptrCast([*]u8, &out), data.ptr, @sizeOf(T));
    if (T != f32 and T != f64) {
        out = std.mem.bigToNative(T, out);
        // TODO: byteswap floats as well?
    }
    return generic_type(T){ .data = out, .offset = @sizeOf(T) };
}

fn decode_bin(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    var offset: usize = 0;
    const d = try decode_generic(T, data);
    const n = d.data;
    offset += d.offset;
    var out = try alloc.dupe(u8, data[offset..(offset + n)]);
    offset += n;
    return Decoded{ .data = Value{ .RawData = out }, .offset = offset };
}

fn decode_array_n(alloc: *std.mem.Allocator, n: usize, data: []const u8) !Decoded {
    var out = try alloc.alloc(Value, n);
    var j: usize = 0;
    var offset: usize = 0;
    while (j < n) : (j += 1) {
        const d = try decode(alloc, data[offset..]);
        offset += d.offset;
        out[j] = d.data;
    }
    return Decoded{
        .data = Value{ .Array = out },
        .offset = offset,
    };
}

fn decode_map_n(alloc: *std.mem.Allocator, n: usize, data: []const u8) !Decoded {
    var out = KeyValueMap.init(alloc);
    var j: usize = 0;
    var offset: usize = 0;
    while (j < n) : (j += 1) {
        const k = try decode(alloc, data[offset..]);
        offset += k.offset;
        const v = try decode(alloc, data[offset..]);
        offset += v.offset;

        const k_ = try k.data.to_hash_key();
        try out.put(k_, v.data);
    }
    return Decoded{
        .data = Value{ .Map = out },
        .offset = offset,
    };
}

fn decode_array(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    const d = try decode_generic(T, data);
    const n = d.data;
    const out = try decode_array_n(alloc, n, data[d.offset..]);
    return Decoded{
        .data = out.data,
        .offset = d.offset + out.offset,
    };
}

fn decode_map(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    const d = try decode_generic(T, data);
    const n = d.data;
    const out = try decode_map_n(alloc, n, data[d.offset..]);
    return Decoded{
        .data = out.data,
        .offset = d.offset + out.offset,
    };
}

pub fn decode(alloc: *std.mem.Allocator, data: []const u8) anyerror!Decoded {
    const c = data[0];
    var offset: usize = 1;
    const t = switch (c) {
        0x00...0x7f => Value{ .Int = @intCast(i64, c & 0x7F) },

        0x80...0x8f => fixmap: {
            const n = c & 0xF;
            const out = try decode_map_n(alloc, n, data[offset..]);
            offset += out.offset;
            break :fixmap out.data;
        },

        0x90...0x9f => fixarray: {
            const n = c & 0xF;
            const out = try decode_array_n(alloc, n, data[offset..]);
            offset += out.offset;
            break :fixarray out.data;
        },

        0xa0...0xbf => fixstr: {
            const n = c & 0x1F;
            var out = try alloc.dupe(u8, data[offset..(offset + n)]);
            offset += n;
            break :fixstr Value{ .RawString = out };
        },

        0xc0 => Value{ .Nil = {} },
        // 0xc1 is unused
        0xc2 => Value{ .Boolean = false },
        0xc3 => Value{ .Boolean = true },
        0xc4 => bin8: {
            const out = try decode_bin(u8, alloc, data[offset..]);
            offset += out.offset;
            break :bin8 out.data;
        },
        0xc5 => bin16: {
            const out = try decode_bin(u16, alloc, data[offset..]);
            offset += out.offset;
            break :bin16 out.data;
        },
        0xc6 => bin32: {
            const out = try decode_bin(u32, alloc, data[offset..]);
            offset += out.offset;
            break :bin32 out.data;
        },
        0xc7...0xc9 => return MsgPackError.NoExtensionsAllowed,
        0xca => f32: {
            const out = try decode_generic(f32, data[offset..]);
            offset += out.offset;
            break :f32 Value{ .Float = out.data };
        },
        0xcb => f64: {
            const out = try decode_generic(f64, data[offset..]);
            offset += out.offset;
            break :f64 Value{ .Float = out.data };
        },
        0xcc => u8: {
            const out = try decode_generic(u8, data[offset..]);
            offset += out.offset;
            break :u8 Value{ .UInt = out.data };
        },
        0xcd => u16: {
            const out = try decode_generic(u16, data[offset..]);
            offset += out.offset;
            break :u16 Value{ .UInt = out.data };
        },
        0xce => u32: {
            const out = try decode_generic(u32, data[offset..]);
            offset += out.offset;
            break :u32 Value{ .UInt = out.data };
        },
        0xcf => u64: {
            const out = try decode_generic(u64, data[offset..]);
            offset += out.offset;
            break :u64 Value{ .UInt = out.data };
        },
        0xd0 => i8: {
            const out = try decode_generic(i8, data[offset..]);
            offset += out.offset;
            break :i8 Value{ .Int = out.data };
        },
        0xd1 => i16: {
            const out = try decode_generic(i16, data[offset..]);
            offset += out.offset;
            break :i16 Value{ .Int = out.data };
        },
        0xd2 => i32: {
            const out = try decode_generic(i32, data[offset..]);
            offset += out.offset;
            break :i32 Value{ .Int = out.data };
        },
        0xd3 => i64: {
            const out = try decode_generic(i64, data[offset..]);
            offset += out.offset;
            break :i64 Value{ .Int = out.data };
        },

        // TODO: all the fixext
        0xd4...0xd8 => return MsgPackError.NoExtensionsAllowed,

        0xd9 => str8: {
            const out = try decode_bin(u8, alloc, data[offset..]);
            offset += out.offset;
            break :str8 Value{ .RawString = out.data.RawData };
        },
        0xda => str16: {
            const out = try decode_bin(u16, alloc, data[offset..]);
            offset += out.offset;
            break :str16 Value{ .RawString = out.data.RawData };
        },
        0xdb => str32: {
            const out = try decode_bin(u32, alloc, data[offset..]);
            offset += out.offset;
            break :str32 Value{ .RawString = out.data.RawData };
        },

        0xdc => array16: {
            const n = try decode_array(u16, alloc, data[offset..]);
            offset += n.offset;
            break :array16 n.data;
        },
        0xdd => array32: {
            const n = try decode_array(u32, alloc, data[offset..]);
            offset += n.offset;
            break :array32 n.data;
        },
        0xde => map16: {
            const n = try decode_map(u16, alloc, data[offset..]);
            offset += n.offset;
            break :map16 n.data;
        },
        0xdf => map32: {
            const n = try decode_map(u32, alloc, data[offset..]);
            offset += n.offset;
            break :map32 n.data;
        },

        0xe0...0xff => Value{ .Int = @bitCast(i8, c) },

        else => Value{ .Nil = {} },
    };
    return Decoded{
        .data = t,
        .offset = offset,
    };
}

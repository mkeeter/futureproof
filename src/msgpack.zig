// Rough implementation of msgpack, based on the standard online at
// https://github.com/msgpack/msgpack/blob/master/spec.md
const std = @import("std");

const MsgPackError = error{
    InvalidKeyType,
    NoExtensionsAllowed,
    NotAMap,
    NoSuchKey,
    InvalidValueType,
    IntOverflow,
};

pub const Key = union(enum) {
    Int: i64,
    UInt: u64,
    Boolean: bool,
    RawString: []const u8,
    RawData: []const u8,

    fn bytes(self: Key) []const u8 {
        return switch (self) {
            .Int, .UInt, .Boolean => std.mem.asBytes(&self),
            .RawString, .RawData => |data| data,
        };
    }

    fn to_value(self: Key) Value {
        return switch (self) {
            .Int => Value{ .Int = self.Int },
            .UInt => Value{ .UInt = self.UInt },
            .Boolean => Value{ .Boolean = self.Boolean },
            .RawString => Value{ .RawString = self.RawString },
            .RawData => Value{ .RawData = self.RawData },
        };
    }
};

pub const KeyContext = struct {
    pub fn eql(_: KeyContext, a: Key, b: Key) bool {
        if (@as(std.meta.Tag(Key), a) != b) {
            return false;
        } else {
            return std.mem.eql(u8, a.bytes(), b.bytes());
        }
    }

    pub fn hash(_: KeyContext, x: Key) u64 {
        return std.hash.Wyhash.hash(0, x.bytes());
    }
};

pub const KeyValueMap = std.hash_map.HashMap(
    Key,
    Value,
    KeyContext,
    //.{
    //    Key.hash,
    //    Key.eql,
    //},
    std.hash_map.default_max_load_percentage,
);

pub const Ext = struct {
    type: i8,
    data: []const u8,

    pub fn as_u32(self: *const Ext) !u32 {
        if (self.data.len > 4) {
            return MsgPackError.IntOverflow;
        } else {
            var out: u32 = 0;
            var i: u32 = 0;
            while (i < self.data.len) : (i += 1) {
                const j: u32 = i * 8;
                out |= @intCast(u32, self.data[i]) << @intCast(u5, j);
            }
            return out;
        }
    }
};

pub const Value = union(enum) {
    Int: i64,
    UInt: u64,
    Nil: void,
    Boolean: bool,
    Float32: f32,
    Float64: f64,
    RawString: []const u8,
    RawData: []const u8,
    Array: []Value,
    Map: KeyValueMap,
    Ext: Ext,

    pub fn destroy(self: Value, alloc: std.mem.Allocator) void {
        var self_mut = self;
        switch (self_mut) {
            .Map => |map| {
                var itr = map.iterator();
                while (itr.next()) |entry| {
                    entry.key_ptr.to_value().destroy(alloc);
                    entry.value_ptr.destroy(alloc);
                }
                self_mut.Map.deinit();
            },
            .RawString, .RawData => |r| {
                alloc.free(r);
            },
            .Array => |arr| {
                for (arr) |r| {
                    var r_mut = r;
                    r_mut.destroy(alloc);
                }
                alloc.free(arr);
            },
            .Ext => |ext| {
                alloc.free(ext.data);
            },
            else => {},
        }
    }

    pub fn encode(alloc: std.mem.Allocator, v: anytype) !Value {
        const T = @TypeOf(v);
        switch (@typeInfo(T)) {
            .Pointer => |ptr| {
                switch (ptr.size) {
                    .One => {
                        // We only encode things like *const [5:0]u8,
                        // which are used for static strings.
                        switch (@typeInfo(ptr.child)) {
                            .Array => |array| {
                                const x: []const array.child = v[0..];
                                return Value.encode(alloc, x);
                            },
                            else => @compileError("Could not encode pointer"),
                        }
                    },
                    .Slice => {
                        // Special case to encode strings instead of Array(u8)
                        if (ptr.child == u8) {
                            return Value{ .RawString = v };
                        } else {
                            const out = try alloc.alloc(Value, v.len);
                            var i: u32 = 0;
                            while (i < v.len) : (i += 1) {
                                out[i] = try encode(alloc, v[i]);
                            }
                            return Value{ .Array = out };
                        }
                    },
                    else => @compileError("Cannot encode generic pointer"),
                }
            },
            .Array => |array| {
                // Coerce to slice
                const x: []const array.child = v[0..];
                return encode(alloc, &x);
            },
            .Struct => |st| {
                if (@TypeOf(v) == KeyValueMap) {
                    return Value{ .Map = v };
                } else {
                    const out = try alloc.alloc(Value, st.fields.len);
                    comptime var i: u32 = 0;
                    inline while (i < st.fields.len) : (i += 1) {
                        out[i] = try encode(alloc, v[i]);
                    }
                    return Value{ .Array = out };
                }
            },
            else => {
                // Fall through to switch statement below
            },
        }
        return switch (T) {
            Value => v,
            Key => v.to_value(),
            i8, i16, i32, i64, comptime_int => Value{ .Int = v },
            u8, u16, u32, u64, usize => Value{ .UInt = v },
            void => Value{ .Nil = {} },
            bool => Value{ .Boolean = v },
            f32 => Value{ .Float32 = v },
            f64, comptime_float => Value{ .Float64 = v },
            else => @compileError("Cannot encode type " ++ @typeName(T)),
        };
    }

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

    // out should implement the Writer interface
    pub fn serialize(self: Value, out: anytype) anyerror!void {
        switch (self) {
            .Int => |i| {
                switch (i) {
                    // Negative fixnum
                    -32...-1 => _ = try out.write(&std.mem.toBytes(@intCast(i8, i))),
                    // i8
                    0...std.math.maxInt(i8), std.math.minInt(i8)...-33 => {
                        _ = try out.writeByte(0xd0);
                        _ = try out.write(&std.mem.toBytes(@intCast(i8, i)));
                    },
                    // i16
                    (std.math.maxInt(i8) + 1)...std.math.maxInt(i16),
                    std.math.minInt(i16)...(std.math.minInt(i8) - 1),
                    => {
                        _ = try out.writeByte(0xd1);
                        const j = std.mem.nativeToBig(i16, @intCast(i16, i));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    // i32
                    (std.math.maxInt(i16) + 1)...std.math.maxInt(i32),
                    std.math.minInt(i32)...(std.math.minInt(i16) - 1),
                    => {
                        _ = try out.writeByte(0xd2);
                        const j = std.mem.nativeToBig(i32, @intCast(i32, i));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    // i64
                    (std.math.maxInt(i32) + 1)...std.math.maxInt(i64),
                    std.math.minInt(i64)...(std.math.minInt(i32) - 1),
                    => {
                        _ = try out.writeByte(0xd3);
                        const j = std.mem.nativeToBig(i64, @intCast(i64, i));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                }
            },

            .UInt => |u| {
                switch (u) {
                    // Positive fixnum
                    0x00...0x7f => _ = try out.write(&std.mem.toBytes(@intCast(u8, u))),
                    // u8
                    0x80...std.math.maxInt(u8) => {
                        _ = try out.writeByte(0xcc);
                        _ = try out.write(&std.mem.toBytes(@intCast(u8, u)));
                    },
                    // u16
                    (std.math.maxInt(u8) + 1)...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xcd);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, u));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    // u32
                    (std.math.maxInt(u16) + 1)...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xce);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, u));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    // u64
                    (std.math.maxInt(u32) + 1)...std.math.maxInt(u64) => {
                        _ = try out.writeByte(0xcf);
                        const j = std.mem.nativeToBig(u64, @intCast(u64, u));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                }
            },

            .Nil => _ = try out.writeByte(0xc0),
            .Boolean => |b| {
                _ = try out.writeByte(if (b) 0xc3 else 0xc2);
            },
            .Float32 => |f| {
                _ = try out.writeByte(0xca);
                _ = try out.write(&std.mem.toBytes(f));
            },
            .Float64 => |d| {
                _ = try out.writeByte(0xcb);
                _ = try out.write(&std.mem.toBytes(d));
            },

            .RawString => |s| {
                switch (s.len) {
                    0x00...0x1f => {
                        _ = try out.writeByte(0b101_00000 | @intCast(u8, s.len));
                    },
                    0x20...std.math.maxInt(u8) => {
                        _ = try out.writeByte(0xd9);
                        _ = try out.writeByte(@intCast(u8, s.len));
                    },
                    std.math.maxInt(u8) + 1...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xda);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, s.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u16) + 1...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xda);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, s.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    else => std.debug.panic(
                        "String is too large: {} > {}\n",
                        .{ s.len, std.math.maxInt(u32) },
                    ),
                }
                _ = try out.write(s);
            },

            .RawData => |d| {
                switch (d.len) {
                    0x00...std.math.maxInt(u8) => {
                        _ = try out.writeByte(0xc4);
                        _ = try out.writeByte(@intCast(u8, d.len));
                    },
                    std.math.maxInt(u8) + 1...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xc5);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, d.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u16) + 1...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xc6);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, d.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    else => std.debug.panic(
                        "Data is too large: {} > {}\n",
                        .{ d.len, std.math.maxInt(u32) },
                    ),
                }
                _ = try out.write(d);
            },

            .Array => |a| {
                switch (a.len) {
                    0x00...0x0f => {
                        _ = try out.writeByte(0b1001_0000 | @intCast(u8, a.len));
                    },
                    0x10...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xdc);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, a.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u16) + 1...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xdd);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, a.len));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    else => std.debug.panic(
                        "Array is too large: {} > {}\n",
                        .{ a.len, std.math.maxInt(u32) },
                    ),
                }
                for (a) |v| {
                    try v.serialize(out);
                }
            },

            .Map => |m| {
                const count = m.count();
                switch (count) {
                    0x00...0x0f => {
                        _ = try out.writeByte(0b1000_0000 | @intCast(u8, count));
                    },
                    0x10...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xde);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, count));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u16) + 1...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xdf);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, count));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                }
                var itr = m.iterator();
                while (itr.next()) |entry| {
                    try entry.key_ptr.to_value().serialize(out);
                    try entry.value_ptr.serialize(out);
                }
            },

            .Ext => |e| {
                const count = e.data.len;
                switch (count) {
                    0x01 => {
                        _ = try out.writeByte(0xd4);
                    },
                    0x02 => {
                        _ = try out.writeByte(0xd5);
                    },
                    0x04 => {
                        _ = try out.writeByte(0xd6);
                    },
                    0x08 => {
                        _ = try out.writeByte(0xd7);
                    },
                    0x10 => {
                        _ = try out.writeByte(0xd8);
                    },

                    0x00, 0x03, 0x05...0x07, 0x09...0x0f, 0x11...0xff => {
                        _ = try out.writeByte(0xc7);
                        _ = try out.writeByte(@intCast(u8, count));
                    },
                    std.math.maxInt(u8) + 1...std.math.maxInt(u16) => {
                        _ = try out.writeByte(0xc8);
                        const j = std.mem.nativeToBig(u16, @intCast(u16, count));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u16) + 1...std.math.maxInt(u32) => {
                        _ = try out.writeByte(0xc9);
                        const j = std.mem.nativeToBig(u32, @intCast(u32, count));
                        _ = try out.write(&std.mem.toBytes(j));
                    },
                    std.math.maxInt(u32) + 1...std.math.maxInt(u64) => {
                        std.debug.panic("Ext data is too large: {}\n", .{count});
                    },
                }
                _ = try out.writeByte(@bitCast(u8, e.type));
                _ = try out.write(e.data);
            },
        }
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

fn decode_bin(comptime T: type, alloc: std.mem.Allocator, data: []const u8) !Decoded {
    var offset: usize = 0;
    const d = try decode_generic(T, data);
    const n = d.data;
    offset += d.offset;
    const out = try alloc.dupe(u8, data[offset..(offset + n)]);
    offset += n;
    return Decoded{ .data = Value{ .RawData = out }, .offset = offset };
}

fn decode_fixext(comptime len: u32, alloc: std.mem.Allocator, data: []const u8) !Decoded {
    var offset: usize = 0;
    const t = @bitCast(i8, data[0]);
    offset += 1;
    const buf = try alloc.dupe(u8, data[offset..(offset + len)]);
    return Decoded{
        .data = Value{ .Ext = .{ .type = t, .data = buf } },
        .offset = offset + len,
    };
}

fn decode_ext(comptime T: type, alloc: std.mem.Allocator, data: []const u8) !Decoded {
    const t = @bitCast(i8, data[0]);
    var out = try decode_bin(T, alloc, data[1..]);
    return Decoded{
        .data = Value{ .Ext = .{ .type = t, .data = out.data.RawData } },
        .offset = out.offset + 1,
    };
}

fn decode_array_n(alloc: std.mem.Allocator, n: usize, data: []const u8) !Decoded {
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

fn decode_map_n(alloc: std.mem.Allocator, n: usize, data: []const u8) !Decoded {
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

fn decode_array(comptime T: type, alloc: std.mem.Allocator, data: []const u8) !Decoded {
    const d = try decode_generic(T, data);
    const n = d.data;
    const out = try decode_array_n(alloc, n, data[d.offset..]);
    return Decoded{
        .data = out.data,
        .offset = d.offset + out.offset,
    };
}

fn decode_map(comptime T: type, alloc: std.mem.Allocator, data: []const u8) !Decoded {
    const d = try decode_generic(T, data);
    const n = d.data;
    const out = try decode_map_n(alloc, n, data[d.offset..]);
    return Decoded{
        .data = out.data,
        .offset = d.offset + out.offset,
    };
}

pub fn decode(alloc: std.mem.Allocator, data: []const u8) anyerror!Decoded {
    const c = data[0];
    var offset: usize = 1;
    const t = switch (c) {
        0x00...0x7f => Value{ .UInt = @intCast(u64, c & 0x7F) },

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
        0xc7 => ext8: {
            const out = try decode_ext(u8, alloc, data[offset..]);
            offset += out.offset;
            break :ext8 out.data;
        },
        0xc8 => ext16: {
            const out = try decode_ext(u16, alloc, data[offset..]);
            offset += out.offset;
            break :ext16 out.data;
        },
        0xc9 => ext32: {
            const out = try decode_ext(u32, alloc, data[offset..]);
            offset += out.offset;
            break :ext32 out.data;
        },
        0xca => f32: {
            const out = try decode_generic(f32, data[offset..]);
            offset += out.offset;
            break :f32 Value{ .Float32 = out.data };
        },
        0xcb => f64: {
            const out = try decode_generic(f64, data[offset..]);
            offset += out.offset;
            break :f64 Value{ .Float64 = out.data };
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

        0xd4 => fixext1: {
            const out = try decode_fixext(1, alloc, data[offset..]);
            offset += out.offset;
            break :fixext1 out.data;
        },
        0xd5 => fixext2: {
            const out = try decode_fixext(2, alloc, data[offset..]);
            offset += out.offset;
            break :fixext2 out.data;
        },
        0xd6 => fixext4: {
            const out = try decode_fixext(4, alloc, data[offset..]);
            offset += out.offset;
            break :fixext4 out.data;
        },
        0xd7 => fixext8: {
            const out = try decode_fixext(8, alloc, data[offset..]);
            offset += out.offset;
            break :fixext8 out.data;
        },
        0xd8 => fixext16: {
            const out = try decode_fixext(16, alloc, data[offset..]);
            offset += out.offset;
            break :fixext16 out.data;
        },

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

////////////////////////////////////////////////////////////////////////////////

test "msgpack.Value.encode string literal" {
    const tgpa = std.testing.allocator;

    var arena = std.heap.ArenaAllocator.init(tgpa);
    defer arena.deinit();
    const alloc = arena.allocator();

    const v = try Value.encode(alloc, "hello");
    std.testing.expect(v == .RawString);
    std.testing.expectEqualStrings("hello", v.RawString);
}

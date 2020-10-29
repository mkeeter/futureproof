const std = @import("std");

const Type = union(enum) {
    Int: i64,
    UInt: u64,
    Nil: void,
    Boolean: bool,
    Float: f64,
    RawString: []u8,
    RawData: []u8,
    Array: []Type,
    Map: std.AutoHashMap([]u8, Type), // non-string keys are unimplemented
    Extension: void, // unimplemented
};

const Decoded = struct {
    data: Type,
    offset: usize,
};

export fn tester() i32 {
    const t = decode(std.heap.c_allocator, "OMG") catch |err| {
        std.debug.print("oh no: {}\n", .{err});
        return 0;
    };

    if (t.data.Int == 13) {
        return 1;
    } else {
        return 12;
    }
}

fn generic_type(comptime T: type) type {
    return struct {
        data: T,
        offset: usize,
    };
}

fn decode_generic(comptime T: type, data: []const u8) !generic_type(T) {
    var out: T = undefined;
    @memcpy(@ptrCast([*]u8, &out), data.ptr, @sizeOf(T));
    return generic_type(T){ .data = out, .offset = @sizeOf(T) };
}

fn decode_bin(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    var offset: usize = 0;
    var n: T = undefined;
    @memcpy(@ptrCast([*]u8, &n), data.ptr, @sizeOf(T));
    offset += @sizeOf(T);
    var out = try alloc.dupe(u8, data[offset..(offset + n)]);
    offset += n;
    return Decoded{ .data = Type{ .RawData = out }, .offset = offset };
}

fn decode_array_n(alloc: *std.mem.Allocator, n: usize, data: []const u8) !Decoded {
    var out = try alloc.alloc(Type, n);
    var j: usize = 0;
    var offset: usize = 0;
    while (j < n) : (j += 1) {
        const d = try decode(alloc, data[offset..]);
        offset += d.offset;
        out[j] = d.data;
    }
    return Decoded{
        .data = Type{ .Array = out },
        .offset = offset,
    };
}

fn decode_map_n(alloc: *std.mem.Allocator, n: usize, data: []const u8) !Decoded {
    var out = std.AutoHashMap([]u8, Type).init(alloc);
    var j: usize = 0;
    var offset: usize = 0;
    while (j < n) : (j += 1) {
        const k = try decode(alloc, data[offset..]);
        offset += k.offset;
        const v = try decode(alloc, data[offset..]);
        offset += v.offset;

        if (k.data != Type.RawString) {
            std.debug.panic("Can only map strings for now, not {}", .{k});
        }
        try out.put(k.data.RawString, v.data);
    }
    return Decoded{
        .data = Type{ .Map = out },
        .offset = offset,
    };
}

fn decode_array(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    const n = try decode_generic(T, data);
    const out = try decode_array_n(alloc, n.data, data[n.offset..]);
    return Decoded{
        .data = out.data,
        .offset = n.offset + out.offset,
    };
}

fn decode_map(comptime T: type, alloc: *std.mem.Allocator, data: []const u8) !Decoded {
    const n = try decode_generic(T, data);
    const out = try decode_map_n(alloc, n.data, data[n.offset..]);
    return Decoded{
        .data = out.data,
        .offset = n.offset + out.offset,
    };
}

pub fn decode(alloc: *std.mem.Allocator, data: []const u8) anyerror!Decoded {
    var i: usize = 0;
    const c = data[0];
    var offset: usize = 1;
    const t = switch (c) {
        0x00...0x7f => Type{ .Int = @intCast(i64, i & 0x7F) },

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
            const n = c & 0xF;
            var out = try alloc.dupe(u8, data[offset..(offset + n)]);
            offset += n;
            break :fixstr Type{ .RawString = out };
        },

        0xc0 => Type{ .Nil = {} },
        // 0xc1 is unused
        0xc2 => Type{ .Boolean = false },
        0xc3 => Type{ .Boolean = true },
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
        0xc7...0xc9 => std.debug.panic("Extensions not supported\n", .{}),
        0xca => f32: {
            const out = try decode_generic(f32, data[offset..]);
            offset += out.offset;
            break :f32 Type{ .Float = out.data };
        },
        0xcb => f64: {
            const out = try decode_generic(f64, data[offset..]);
            offset += out.offset;
            break :f64 Type{ .Float = out.data };
        },
        0xcc => u8: {
            const out = try decode_generic(u8, data[offset..]);
            offset += out.offset;
            break :u8 Type{ .UInt = out.data };
        },
        0xcd => u16: {
            const out = try decode_generic(u16, data[offset..]);
            offset += out.offset;
            break :u16 Type{ .UInt = out.data };
        },
        0xce => u32: {
            const out = try decode_generic(u32, data[offset..]);
            offset += out.offset;
            break :u32 Type{ .UInt = out.data };
        },
        0xcf => u64: {
            const out = try decode_generic(u64, data[offset..]);
            offset += out.offset;
            break :u64 Type{ .UInt = out.data };
        },
        0xd0 => i8: {
            const out = try decode_generic(i8, data[offset..]);
            offset += out.offset;
            break :i8 Type{ .Int = out.data };
        },
        0xd1 => i16: {
            const out = try decode_generic(i16, data[offset..]);
            offset += out.offset;
            break :i16 Type{ .Int = out.data };
        },
        0xd2 => i32: {
            const out = try decode_generic(i32, data[offset..]);
            offset += out.offset;
            break :i32 Type{ .Int = out.data };
        },
        0xd3 => i64: {
            const out = try decode_generic(i64, data[offset..]);
            offset += out.offset;
            break :i64 Type{ .Int = out.data };
        },

        // TODO: all the fixext
        0xd4 => fixext1: {
            offset += 2;
            break :fixext1 Type{ .Nil = {} };
        },
        0xd5 => fixext2: {
            offset += 3;
            break :fixext2 Type{ .Nil = {} };
        },
        0xd6 => fixext4: {
            offset += 5;
            break :fixext4 Type{ .Nil = {} };
        },
        0xd7 => fixext8: {
            offset += 9;
            break :fixext8 Type{ .Nil = {} };
        },
        0xd8 => fixext16: {
            offset += 17;
            break :fixext16 Type{ .Nil = {} };
        },

        0xd9 => str8: {
            const out = try decode_bin(u8, alloc, data[offset..]);
            offset += out.offset;
            break :str8 Type{ .RawString = out.data.RawData };
        },
        0xda => str16: {
            const out = try decode_bin(u16, alloc, data[offset..]);
            offset += out.offset;
            break :str16 Type{ .RawString = out.data.RawData };
        },
        0xdb => str32: {
            const out = try decode_bin(u32, alloc, data[offset..]);
            offset += out.offset;
            break :str32 Type{ .RawString = out.data.RawData };
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

        0xe0...0xff => Type{ .Int = @bitCast(i8, c) },

        else => Type{ .Nil = {} },
    };
    return Decoded{
        .data = t,
        .offset = offset,
    };
}

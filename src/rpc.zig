// This is a rough implementation of the msgpack-rpc standard, online at
// https://github.com/msgpack-rpc/msgpack-rpc/blob/master/spec.md
const std = @import("std");

const c = @import("c.zig");
const msgpack = @import("msgpack.zig");
const blocking_queue = @import("blocking_queue.zig");

const RPCQueue = blocking_queue.BlockingQueue(msgpack.Value);

const RPC_TYPE_REQUEST: u32 = 0;
const RPC_TYPE_RESPONSE: u32 = 1;
const RPC_TYPE_NOTIFICATION: u32 = 2;

const Listener = struct {
    input: std.fs.File.Reader, // This is the stdout of the RPC subprocess
    event_queue: RPCQueue,
    response_queue: RPCQueue,
    alloc: *std.mem.Allocator,

    fn run(self: *Listener) !void {
        var buf: [1024 * 32]u8 = undefined;
        while (true) {
            const in = try self.input.read(&buf);
            const v = try msgpack.decode(self.alloc, buf[0..in]);
            if (v.data.Array[0].UInt == RPC_TYPE_RESPONSE) {
                try self.response_queue.put(v.data);
            } else if (v.data.Array[0].UInt == RPC_TYPE_NOTIFICATION) {
                try self.event_queue.put(v.data);
                c.glfwPostEmptyEvent();
            }
            // TODO: shift data in the buffer over, in case it contained
            // another msgpack message
            std.debug.assert(v.offset == in);
        }
    }
};

pub const RPC = struct {
    listener: *Listener,

    output: std.fs.File.Writer, // This is the stdin of the RPC subprocess
    process: *std.ChildProcess,
    alloc: *std.mem.Allocator,
    msgid: u32,

    pub fn init(argv: []const []const u8, alloc: *std.mem.Allocator) !RPC {
        const child = try std.ChildProcess.init(argv, alloc);
        child.stdin_behavior = .Pipe;
        child.stdout_behavior = .Pipe;
        try child.spawn();

        const out = (child.stdin orelse std.debug.panic("Could not get stdout", .{})).writer();

        const listener = try alloc.create(Listener);
        listener.* = .{
            .event_queue = RPCQueue.init(alloc),
            .response_queue = RPCQueue.init(alloc),
            .input = (child.stdout orelse std.debug.panic("Could not get stdout", .{})).reader(),
            .alloc = alloc,
        };

        // TODO: store this somewhere?
        const thread = std.Thread.spawn(listener, Listener.run);

        const rpc = .{
            .listener = listener,
            .output = out,
            .process = child,
            .alloc = alloc,
            .msgid = 0,
        };
        return rpc;
    }

    pub fn get_event(self: *RPC) ?msgpack.Value {
        return self.listener.event_queue.try_get();
    }

    pub fn release_event(self: *RPC, value: msgpack.Value) !void {
        // TODO: recursively free the Value using the allocator
    }

    pub fn call(self: *RPC, method: []const u8, params: anytype) !msgpack.Value {
        // We'll use an arena for the encoded message
        var arena = std.heap.ArenaAllocator.init(self.alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        const p = try msgpack.Value.encode(tmp_alloc, params);
        const v = try msgpack.Value.encode(tmp_alloc, .{ RPC_TYPE_REQUEST, self.msgid, method, p });
        try v.serialize(self.output);
        const response = self.listener.response_queue.get();

        // Check that the msgids are correct
        std.debug.assert(response.Array[1].UInt == self.msgid);
        self.msgid = self.msgid +% 1;

        // Check for error responses
        const err = response.Array[2];
        const result = response.Array[3];
        if (err != @TagType(msgpack.Value).Nil) {
            // TODO: handle error here
        }

        // TODO: decode somehow?
        return result;
    }
};

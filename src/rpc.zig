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
    alloc: std.mem.Allocator,

    fn run(self: *Listener) !void {
        var buf: [1024 * 1024]u8 = undefined;
        while (true) {
            const in = try self.input.read(&buf);
            if (in == 0) {
                break;
            } else if (in == buf.len) {
                std.debug.panic("msgpack message is too long\n", .{});
            }
            var offset: usize = 0;
            while (offset != in) {
                const v = try msgpack.decode(self.alloc, buf[offset..in]);
                switch (v.data.Array[0]) {
                    .UInt => |u| {
                        if (u == RPC_TYPE_RESPONSE) {
                            try self.response_queue.put(v.data);
                        } else if (u == RPC_TYPE_NOTIFICATION) {
                            try self.event_queue.put(v.data);
                            c.glfwPostEmptyEvent();
                        }
                        //offset += v.offset;
                    },
                    else => std.debug.print("Unknown msg: {}\n", .{v.data.Array[0]}),
                }
                offset += v.offset;
            }
            std.debug.assert(offset == in);
        }
        try self.event_queue.put(msgpack.Value{ .Int = -1 });
        c.glfwPostEmptyEvent();
    }
};

pub const RPC = struct {
    listener: *Listener,

    output: std.fs.File.Writer, // This is the stdin of the RPC subprocess
    process: *std.ChildProcess,
    thread: std.Thread,
    alloc: std.mem.Allocator,
    msgid: u32,

    pub fn init(argv: []const []const u8, alloc: std.mem.Allocator) !RPC {
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

        const thread = try std.Thread.spawn(.{}, Listener.run, .{listener});

        const rpc = .{
            .listener = listener,
            .output = out,
            .process = child,
            .alloc = alloc,
            .thread = thread,
            .msgid = 0,
        };
        return rpc;
    }

    pub fn get_event(self: *RPC) ?msgpack.Value {
        return self.listener.event_queue.try_get();
    }

    pub fn release(self: *RPC, value: msgpack.Value) void {
        value.destroy(self.alloc);
    }

    pub fn call_release(self: *RPC, method: []const u8, params: anytype) !void {
        self.release(try self.call(method, params));
    }

    pub fn call(self: *RPC, method: []const u8, params: anytype) !msgpack.Value {
        // We'll use an arena for the encoded message
        var arena = std.heap.ArenaAllocator.init(self.alloc);
        defer arena.deinit();

        const tmp_alloc = arena.allocator();

        // Push the serialized call to the subprocess's stdin
        const p = try msgpack.Value.encode(tmp_alloc, params);
        const v = try msgpack.Value.encode(tmp_alloc, .{ RPC_TYPE_REQUEST, self.msgid, method, p });
        try v.serialize(self.output);

        // Wait for a reply from the worker thread
        const response = self.listener.response_queue.get();
        defer self.release(response);

        // Check that the msgids are correct
        std.debug.assert(response.Array[1].UInt == self.msgid);
        self.msgid = self.msgid +% 1;

        // Check for error responses
        const err = response.Array[2];
        const result = response.Array[3];
        if (err != std.meta.Tag(msgpack.Value).Nil) {
            // TODO: handle error here
            std.debug.panic("Got error in msgpack-rpc call: {}\n", .{err.Array[1]});
        }

        // Steal the result from the array, so it's not destroyed
        response.Array[3] = .Nil;

        // TODO: decode somehow?
        return result;
    }

    pub fn deinit(self: *RPC) void {
        self.process.deinit();
        self.alloc.destroy(self.listener);
    }

    pub fn halt(self: *RPC) !std.ChildProcess.Term {
        // Manually close stdin, to halt the subprocess on the other side
        (self.process.stdin orelse unreachable).close();
        self.process.stdin = null;
        const term = try self.process.wait();
        self.thread.join();

        // Flush out the queue to avoid memory leaks
        while (self.get_event()) |event| {
            self.release(event);
        }

        return term;
    }
};

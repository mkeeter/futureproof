const std = @import("std");

const msgpack = @import("msgpack.zig");
const blocking_queue = @import("blocking_queue.zig");

const RPCQueue = blocking_queue.BlockingQueue(msgpack.Value);

const Listener = struct {
    input: *std.fs.File, // This is the stdout of the RPC subprocess
    event_queue: *RPCQueue,
    response_queue: *RPCQueue,
};

const Caller = struct {
    output: *std.fs.File, // This is the stdin of the RPC subprocess
    response_queue: *RPCQueue, // coming from the Listener thread
    return_queue: *RPCQueue, // going back to the main thread
};

pub const RPC = struct {
    event_queue: RPCQueue,
    response_queue: RPCQueue,
    return_queue: RPCQueue,
    listener: Listener,
    caller: Caller,

    process: *std.ChildProcess,

    pub fn init(argv: []const []const u8, alloc: *std.mem.Allocator) !RPC {
        const c = try std.ChildProcess.init(argv, alloc);
        c.stdin_behavior = .Pipe;
        c.stdout_behavior = .Pipe;
        try c.spawn();

        var event_queue = RPCQueue.init(alloc);
        var response_queue = RPCQueue.init(alloc);
        var return_queue = RPCQueue.init(alloc);

        var rpc = RPC{
            .event_queue = event_queue,
            .response_queue = response_queue,
            .return_queue = return_queue,
            .listener = Listener{
                .input = &(c.stdout orelse std.debug.panic("Could not get stdout", .{})),
                .event_queue = &event_queue,
                .response_queue = &response_queue,
            },
            .caller = Caller{
                .output = &(c.stdin orelse std.debug.panic("Could not get stdout", .{})),
                .response_queue = &response_queue,
                .return_queue = &return_queue,
            },
            .process = c,
        };
        return rpc;
    }
};

const std = @import("std");

// A blocking SPSC queue, used so that threads can sleep while waiting
// for another thread to pass them data.
pub fn BlockingQueue(comptime T: type) type {
    return struct {
        inner: std.atomic.Queue(T),
        event: std.ResetEvent,
        alloc: *std.mem.Allocator,

        pub const Self = @This();

        pub fn init(alloc: *std.mem.Allocator) Self {
            return .{
                .inner = std.atomic.Queue(T).init(),
                .event = std.ResetEvent.init(),
                .alloc = alloc,
            };
        }

        pub fn put(self: *Self, i: T) !void {
            const node = try self.alloc.create(std.atomic.Queue(T).Node);
            node.* = .{
                .prev = undefined,
                .next = undefined,
                .data = i,
            };
            self.inner.put(node);
            self.event.set();
        }

        pub fn get(self: *Self) T {
            self.event.wait();
            self.event.reset();
            const node = self.inner.get() orelse std.debug.panic("Could not get node", .{});
            defer self.alloc.destroy(node);
            return node.data;
        }
    };
}

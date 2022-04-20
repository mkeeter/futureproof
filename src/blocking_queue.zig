const std = @import("std");

// A blocking SPSC queue, used so that threads can sleep while waiting
// for another thread to pass them data.
pub fn BlockingQueue(comptime T: type) type {
    return struct {
        inner: std.atomic.Queue(T),
        event: std.Thread.ResetEvent,
        alloc: std.mem.Allocator,

        pub const Self = @This();

        pub fn init(alloc: std.mem.Allocator) Self {
            var event: std.Thread.ResetEvent = undefined;
            std.Thread.ResetEvent.init(&event) catch |err| {
                std.debug.panic("Failed to initialize event: {}\n", .{err});
            };
            return .{
                .inner = std.atomic.Queue(T).init(),
                .event = event,
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

            const node = self.inner.get() orelse std.debug.panic("Could not get node", .{});
            defer self.alloc.destroy(node);
            self.check_flag();

            return node.data;
        }

        fn check_flag(self: *Self) void {
            self.inner.mutex.lock();
            defer self.inner.mutex.unlock();

            // Manually check the state of the queue, as isEmpty() would
            // also try to lock the mutex, causing a deadlock
            if (self.inner.head == null) {
                self.event.reset();
            }
        }

        pub fn try_get(self: *Self) ?T {
            if (self.inner.get()) |node| {
                defer self.alloc.destroy(node);
                self.check_flag();
                return node.data;
            }
            return null;
        }
    };
}

const std = @import("std");

const c = @import("c.zig");

pub fn Debounce(comptime T: type, dt_ms: i64) type {
    return struct {
        const Self = @This();

        thread: ?*std.Thread,

        // The mutex protects all of the variables below
        mutex: std.Mutex,
        end_time_ms: i64,
        thread_running: bool,
        next: T,
        output: ?T,

        pub fn init() Self {
            return Self{
                .mutex = std.Mutex{},

                .end_time_ms = 0,
                .thread = null,
                .thread_running = false,
                .next = undefined,
                .output = null,
            };
        }

        fn run(self: *Self) void {
            while (true) {
                const lock = self.mutex.acquire();
                const now_time = std.time.milliTimestamp();
                if (now_time >= self.end_time_ms) {
                    self.output = self.next;
                    self.thread_running = false;
                    lock.release();
                    break;
                } else {
                    const dt = self.end_time_ms - now_time;
                    lock.release();
                    std.time.sleep(@intCast(u64, dt) * 1000 * 1000);
                }
            }
            c.glfwPostEmptyEvent();
        }

        // After dt nanoseconds have elapsed, a call to check() will return
        // the value v (unless another call to update happens, which will
        // reset the timer).
        pub fn update(self: *Self, v: T) !void {
            const lock = self.mutex.acquire();
            defer lock.release();

            self.next = v;
            self.end_time_ms = std.time.milliTimestamp() + dt_ms;
            if (!self.thread_running) {
                if (self.thread) |thread| {
                    thread.wait();
                }
                self.thread = try std.Thread.spawn(self, Self.run);
                self.thread_running = true;
            } else {
                // The already-running thread will handle it
            }
        }

        pub fn check(self: *Self) ?T {
            const lock = self.mutex.acquire();
            defer lock.release();

            const out = self.output;
            self.output = null;
            return out;
        }
    };
}

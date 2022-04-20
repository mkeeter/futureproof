const std = @import("std");

const c = @import("c.zig");

// The Debounce struct is triggered with update(T).  After dt_ms milliseconds,
// a call to check() returns T.  Intermediate calls to update() will restart
// the timer and change the value which will eventually be returned by check().
pub fn Debounce(comptime T: type, dt_ms: i64) type {
    return struct {
        const Self = @This();

        thread: ?std.Thread,

        // The mutex protects all of the variables below
        mutex: std.Thread.Mutex,
        end_time_ms: i64,
        thread_running: bool,
        next: T,
        output: ?T,

        pub fn init() Self {
            return Self{
                .mutex = std.Thread.Mutex{},

                .end_time_ms = 0,
                .thread = null,
                .thread_running = false,
                .next = undefined,
                .output = null,
            };
        }

        fn run(self: *Self) void {
            while (true) {
                self.mutex.lock();
                const now_time = std.time.milliTimestamp();
                if (now_time >= self.end_time_ms) {
                    self.output = self.next;
                    self.thread_running = false;
                    defer self.mutex.unlock();
                    break;
                } else {
                    const dt = self.end_time_ms - now_time;
                    defer self.mutex.unlock();
                    std.time.sleep(@intCast(u64, dt) * 1000 * 1000);
                }
            }
            c.glfwPostEmptyEvent();
        }

        // After dt nanoseconds have elapsed, a call to check() will return
        // the value v (unless another call to update happens, which will
        // reset the timer).
        pub fn update(self: *Self, v: T) !void {
            self.mutex.lock();
            defer self.mutex.unlock();

            self.next = v;
            self.end_time_ms = std.time.milliTimestamp() + dt_ms;
            if (!self.thread_running) {
                if (self.thread) |thread| {
                    thread.join();
                }
                self.thread = try std.Thread.spawn(.{}, Self.run, .{self});
                self.thread_running = true;
            } else {
                // The already-running thread will handle it
            }
        }

        pub fn check(self: *Self) ?T {
            self.mutex.lock();
            defer self.mutex.unlock();

            const out = self.output;
            self.output = null;
            return out;
        }
    };
}

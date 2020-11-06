const std = @import("std");

const c = @import("c.zig");
const msgpack = @import("msgpack.zig");
const blocking_queue = @import("blocking_queue.zig");
const rpc = @import("rpc.zig");
const window = @import("window.zig");

export fn size_cb(w: ?*c.GLFWwindow, width: c_int, height: c_int) void {
    // TODO: redraw here, so that it scales with redraw
    // assign with     _ = c.glfwSetWindowSizeCallback(window, size_cb);
}

pub fn main() anyerror!void {
    var gp_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.testing.expect(!gp_alloc.deinit());
    const alloc: *std.mem.Allocator = &gp_alloc.allocator;

    const nvim_cmd = [_][]const u8{
        "nvim", "--embed",
    };
    var nvim = try rpc.RPC.init(&nvim_cmd, alloc);
    defer nvim.deinit();

    var options = msgpack.KeyValueMap.init(alloc);
    try options.put(
        msgpack.Key{ .RawString = "ext_linegrid" },
        msgpack.Value{ .Boolean = true },
    );
    defer options.deinit();

    const reply = try nvim.call("nvim_ui_attach", .{ 64, 24, options });
    defer reply.deinit(alloc);

    std.debug.print("reply: .{}\n", .{reply});

    if (c.glfwInit() != c.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    var w = try window.Window.init(640, 480, "futureproof");
    defer w.deinit();

    var char_grid: [512 * 512]u32 = undefined;
    std.mem.set(u32, char_grid[0..], 0);

    while (!w.should_close()) {
        w.check_size();
        w.redraw();
        std.debug.print("window: {} {}\n", .{ w.x_tiles, w.y_tiles });

        while (nvim.get_event()) |event| {
            for (event.Array[2].Array) |cmd| {
                if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_line")) {
                    for (cmd.Array[1..]) |v| {
                        const line = v.Array;
                        const grid = line[0].UInt;
                        const row = line[1].UInt;
                        var col = line[2].UInt;
                        std.debug.print("Printing at {} {}\n    '", .{ row, col });
                        for (line[3].Array) |cell_| {
                            const cell = cell_.Array;
                            const text = cell[0].RawString;
                            const repeat = if (cell.len >= 3) cell[2].UInt else 1;
                            std.debug.print("{} {}\t", .{ text, repeat });
                            std.debug.assert(text.len == 1);
                            var i: usize = 0;
                            while (i < repeat) : (i += 1) {
                                char_grid[col + row * w.x_tiles] = text[0];
                                col += 1; // TODO: unicode?!
                            }
                        }
                        std.debug.print("'\n", .{});
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_scroll")) {
                    for (cmd.Array[1..]) |v| {
                        const line = v.Array;
                        const grid = line[0].UInt;
                        const top = @intCast(i32, line[1].UInt);
                        const bot = @intCast(i32, line[2].UInt);
                        const left = line[3].UInt;
                        const right = line[4].UInt;
                        const rows = @intCast(i32, line[5].UInt);
                        const cols = line[6].UInt;
                        std.debug.assert(cols == 0);

                        var y: i32 = if (rows > 0) (bot - rows) else (top + rows - 1);
                        var dy: i32 = if (rows > 0) 1 else -1;
                        var y_final: i32 = if (rows > 0) bot else (top - 1);
                        while (y != y_final) : (y += dy) {
                            var x = left;
                            const y_src = @intCast(u32, y);
                            const y_dst = @intCast(u32, y - rows);
                            while (x < right) : (x += 1) {
                                const char = char_grid[x + y_src * w.x_tiles];
                                char_grid[x + y_dst * w.x_tiles] = char;
                            }
                        }
                    }
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "flush")) {
                    w.update_grid(char_grid[0..w.total_tiles]);
                } else if (std.mem.eql(u8, cmd.Array[0].RawString, "grid_clear")) {
                    std.mem.set(u32, char_grid[0..], 0);
                } else {
                    std.debug.print("Unimplemented: {}\n", .{cmd.Array[0]});
                }
            }
            try nvim.release_event(event);
        }

        c.glfwWaitEvents();
    }

    // Halt the subprocess, then clean out any remaining items in the queue
    _ = try nvim.halt(); // Ignore return code
}

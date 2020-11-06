const std = @import("std");
const Window = @import("window").Window;
const Renderer = @import("window").Renderer;

pub const Tui = struct {
    const Self = @This();

    alloc: *std.mem.Allocator,

    w: Window,
    font: ft.Atlas,
    char_grid: [512 * 512]u32,

    x_tiles: u32,
    y_tiles: u32,
    total_tiles: u32,

    font: ft.Atlas,

    pub fn deinit(self: *Tui) void {}

    pub fn init(alloc: *std.mem.Allocator) !Self {
        // We'll use an arena for transient CPU-side resources
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        const width = 640;
        const height = 480;

        const window = Window.init(alloc, width, height, "futureproof");

        const font = try ft.build_atlas(
            tmp_alloc,
            "font/Inconsolata-Regular.ttf",
            40,
            512,
        );
        const renderer = Renderer.init(alloc, window, font);

        const x_tiles = @intCast(u32, width) / self.font.u.glyph_advance;
        const y_tiles = @intCast(u32, height) / self.font.u.glyph_height;
        const total_tiles = x_tiles * y_tiles;
    }
};

const std = @import("std");
const Window = @import("window").Window;
const Renderer = @import("window").Renderer;

pub const Tui = struct {
    const Self = @This();

    w: Window,
    font: ft.Atlas,
    char_grid: [512 * 512]u32,

    x_tiles: u32,
    y_tiles: u32,
    total_tiles: u32,

    font: ft.Atlas,

    pub fn init(alloc: *std.mem.Allocator) !Self {
        // We'll use an arena for transient CPU-side resources
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        // Create and upload the font atlas texture
        const font = try ft.build_atlas(
            tmp_alloc,
            "font/Inconsolata-Regular.ttf",
            40,
            512,
        );

        const x_tiles = @intCast(u32, width) / self.font.u.glyph_advance;
        const y_tiles = @intCast(u32, height) / self.font.u.glyph_height;
        const total_tiles = x_tiles * y_tiles;

        const window = Window.init(alloc, 640, 480, "futureproof");
        const renderer = Renderer.init(alloc, window);
    }
};

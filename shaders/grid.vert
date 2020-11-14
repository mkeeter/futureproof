#version 450
#pragma shader_stage(vertex)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

layout(set=0, binding=2, std430) uniform Uniforms {
    fpUniforms u;
};
layout(set=0, binding=3) buffer CharGrid {
    uint[] char_grid;
};

layout(location=0) out vec2 v_tex_coords;
layout(location=1) out flat uint v_ascii;
layout(location=2) out flat uint v_cursor;

// Hard-coded triangle layout
const ivec2 positions[6] = ivec2[6](
    ivec2(0, 0),
    ivec2(1, 0),
    ivec2(0, 1),
    ivec2(1, 0),
    ivec2(0, 1),
    ivec2(1, 1)
);

void main() {
    uint tile_id = gl_VertexIndex / 6;
    const uint x_tiles = u.width_px / u.font.glyph_advance;
    const uint y_tiles = u.height_px / u.font.glyph_height;
    const uint total_tiles = x_tiles * y_tiles;

    v_ascii = char_grid[tile_id];
    fpGlyph glyph = u.font.glyphs[v_ascii];

    v_cursor = (tile_id % x_tiles == char_grid[total_tiles] &&
                tile_id / x_tiles == char_grid[total_tiles + 1]) ? 1 : 0;

    // Tile position (0 to x_tiles, 0 to y_tiles)
    ivec2 tile = ivec2(tile_id % x_tiles, y_tiles - 1 - (tile_id / x_tiles));

    ivec2 p = positions[gl_VertexIndex % 6];

    // Position of the tile vertex within the tile
    ivec2 tile_pos_px = (tile + p) * ivec2(u.font.glyph_advance, u.font.glyph_height);

    // Convert from pixels to window units
    vec2 vf = (tile_pos_px / vec2(u.width_px, u.height_px) - 0.5) * 2;
    gl_Position = vec4(vf, 0.0, 1.0);

    /*  We want to interpolate so that the texture coordinates on
     *  the grid are 0 at the character subregion's corners.  In 1D,
     *  this looks like this:
     *
     *  t0---0--------v-----t0 + dt [texture coordinate]
     *   0---x1-------x2----dx      [pixel position]
     *
     *  Solve for t0 and dt in terms of x1, d2, dx, v
     *
     *  t0 + dt * x1 / dx = 0
     *  t0 + dt * x2 / dx = v
     *
     *  dt / dx * (x1 - x2) = -v
     *      -> dt = v*dx / (x2 - x1)
     *      -> t0 = v*x1 / (x1 - x2)
     */
    float dx = u.font.glyph_advance;
    float x1 = glyph.x_offset;
    float x2 = x1 + glyph.width;
    float vx = glyph.width;
    float t0x = vx * x1 / (x1 - x2);
    float dtx = vx * dx / (x2 - x1);
    float t1x = t0x + dtx;

    float dy = u.font.glyph_height;
    float y1 = glyph.y_offset;
    float y2 = y1 + glyph.height;
    float vy = glyph.height;
    float t0y = vy * y1 / (y1 - y2);
    float dty = vy * dy / (y2 - y1);
    float t1y = t0y + dty;

    float tx = (p.x == 0 ? t0x : t1x);
    float ty = (p.y == 0 ? t0y : t1y);
    v_tex_coords = vec2(tx, ty);
}

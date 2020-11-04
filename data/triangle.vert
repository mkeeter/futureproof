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

// Hard-coded triangle layout
const vec2 positions[6] = vec2[6](
    vec2(0.0, 0.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 1.0)
);

uint random (vec2 st) {
    return uint(fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123) * 127);
}

void main() {
    uint tile_id = gl_VertexIndex / 6;

    // Tile position (0 to x_tiles, 0 to y_tiles)
    ivec2 tile = ivec2(tile_id % u.x_tiles, tile_id / u.x_tiles);

    v_ascii = random(tile); // 'a', hardcoded for now
    fpGlyph glyph = u.font.glyphs[char_grid[tile_id]];

    // Pixel position (0 to width_px, 0 to height_px)
    ivec2 p = tile * ivec2(u.font.glyph_advance, u.font.glyph_height) +
              ivec2(glyph.x_offset, glyph.y_offset - glyph.height + u.font.glyph_z_offset);

    vec2 f = (p / vec2(u.width_px, u.height_px) - 0.5) * 2;
    const vec2 tile_size_f = vec2(glyph.width  * 2.0 / u.width_px,
                                  glyph.height * 2.0 / u.height_px);

    gl_Position = vec4(f + tile_size_f * positions[gl_VertexIndex % 6], 0.0, 1.0);
    v_tex_coords = positions[gl_VertexIndex % 6];
}

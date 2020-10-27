#version 450
#pragma shader_stage(vertex)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

out gl_PerVertex {
    vec4 gl_Position;
};

layout(location=0) out vec2 v_tex_coords;
layout(set=0, binding=2, std430) uniform Uniforms {
    fpUniforms u;
};

// Hard-coded triangle layout
const vec2 positions[6] = vec2[6](
    vec2(0.0, 0.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 1.0)
);

void main() {
    uint tile_id = gl_VertexIndex / 6;

    // Tile position (0 to x_tiles, 0 to y_tiles)
    uvec2 tile = uvec2(tile_id % u.x_tiles, tile_id / u.x_tiles);

    // Pixel position (0 to width_px, 0 to height_px)
    uvec2 p = tile * uvec2(u.font.glyph_advance, u.font.glyph_height);

    vec2 f = (p / vec2(u.width_px, u.height_px) - 0.5) * 2;
    const vec2 tile_size_f = vec2(u.font.glyph_advance / float(u.width_px),
                                  u.font.glyph_height / float(u.height_px));

    gl_Position = vec4(f + tile_size_f * positions[gl_VertexIndex % 6], 0.0, 1.0);
    v_tex_coords = positions[gl_VertexIndex % 6];
}

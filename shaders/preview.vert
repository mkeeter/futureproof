#version 450
#pragma shader_stage(vertex)
#extension GL_EXT_scalar_block_layout : require
#include "extern/preview.h"
layout(set=0, binding=0, std430) uniform Uniforms {
    FP_PREVIEW_UNIFORMS
};

void main() {
    vec2 pos;
    switch (gl_VertexIndex) {
        case 0: pos = vec2(-1.0,  1.0); break;
        case 1: pos = vec2(-1.0, -1.0); break;
        case 2: pos = vec2( 1.0, -1.0); break;
        case 3: pos = vec2(-1.0,  1.0); break;
        case 4: pos = vec2( 1.0, -1.0); break;
        case 5: pos = vec2( 1.0,  1.0); break;
        default: pos = vec2(0); break; // invalid
    }
    const uint dx = _tiles_per_side % _tile_num;
    const uint dy = _tiles_per_side / _tile_num;
    pos = vec2(-1, -1) +
          vec2(dx, dy) * 2.0 / _tiles_per_side +
          pos / _tiles_per_side;

    gl_Position = vec4(pos, 0.0, 1.0);
}

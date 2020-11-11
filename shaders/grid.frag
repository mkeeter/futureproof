#version 450
#pragma shader_stage(fragment)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

layout(location=0) in  vec2 v_tex_coords;
layout(location=1) in flat uint v_ascii;
layout(location=2) in flat uint v_cursor;

layout(location=0) out vec4 out_color;

layout(set=0, binding=0) uniform texture2D font_tex;
layout(set=0, binding=1) uniform sampler font_sampler;
layout(set=0, binding=2, std430) uniform Uniforms {
    fpUniforms u;
};

void main() {
    if (v_cursor != 0) {
        out_color = vec4(1.0, 1.0, 1.0, 1.0);
    } else if (v_tex_coords.x >= 0 && v_tex_coords.x <= 1 ||
               v_tex_coords.y >= 0 && v_tex_coords.y <= 1)
    {
        fpGlyph glyph = u.font.glyphs[v_ascii];
        ivec2 i = ivec2(glyph.x0 + v_tex_coords.x * glyph.width,
                        glyph.y0 + (1 - v_tex_coords.y) * glyph.height);
        float t = texelFetch(sampler2D(font_tex, font_sampler), i, 0).r;
        out_color = vec4(t, t, t, 1.0);
    } else {
        out_color = vec4(0.0, 0.0, 0.0, 1.0);
    }
}

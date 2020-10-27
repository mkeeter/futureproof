#version 450
#pragma shader_stage(fragment)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

layout(location=0) in  vec2 v_tex_coords;
layout(location=1) in flat uint v_ascii;

layout(location=0) out vec4 out_color;

layout(set=0, binding=0) uniform texture2D font_tex;
layout(set=0, binding=1) uniform sampler font_sampler;
layout(set=0, binding=2, std430) uniform Uniforms {
    fpUniforms u;
};

void main() {
    fpGlyph glyph = u.font.glyphs[v_ascii];

    float t = texelFetch(sampler2D(font_tex, font_sampler),
                         ivec2(glyph.x0 + v_tex_coords.x * glyph.width,
                               glyph.y0 + (1 - v_tex_coords.y) * glyph.height),
                         0).r;
    out_color = vec4(t, t, t, 1.0);
}

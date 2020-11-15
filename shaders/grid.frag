#version 450
#pragma shader_stage(fragment)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

layout(location=0) in  vec2 v_tex_coords;
layout(location=1) in flat uint v_ascii;
layout(location=2) in flat uint v_hl_attr;
layout(location=3) in flat uint v_cursor;

layout(location=0) out vec4 out_color;

layout(set=0, binding=0) uniform texture2D font_tex;
layout(set=0, binding=1) uniform sampler font_sampler;
layout(set=0, binding=2, std430) uniform Uniforms {
    fpUniforms u;
};

vec3 to_vec3(uint u) {
    return vec3(((u >> 0)  & 0xFF) / 255.0,
                ((u >> 8)  & 0xFF) / 255.0,
                ((u >> 16) & 0xFF) / 255.0);
}

void main() {
    fpGlyph glyph = u.font.glyphs[v_ascii];
    fpHlAttrs attrs = u.attrs[v_hl_attr];

    vec3 fg = to_vec3(attrs.foreground == 0xFFFFFFFF ? u.attrs[0].foreground : attrs.foreground);
    vec3 bg = to_vec3(attrs.background == 0xFFFFFFFF ? u.attrs[0].background : attrs.background);
    vec3 sp = to_vec3(attrs.special == 0xFFFFFFFF ? u.attrs[0].special : attrs.special);

    if ((attrs.flags & FP_FLAG_REVERSE) != 0) {
        vec3 tmp = fg;
        fg = bg;
        bg = tmp;
    }

    if (v_cursor != 0) {
        out_color = vec4(1.0, 1.0, 1.0, 1.0);
    } else if (v_tex_coords.x >= 0 && v_tex_coords.x < glyph.width &&
               v_tex_coords.y > 0 && v_tex_coords.y <= glyph.height)
    {
        ivec2 i = ivec2(glyph.x0 + v_tex_coords.x,
                        glyph.y0 + glyph.height - v_tex_coords.y);
        vec3 t = texelFetch(sampler2D(font_tex, font_sampler), i, 0).rgb;

        // Blending foreground and background
        vec3 color = t * fg + (1.0 - t) * bg;

        // Gamma correction
        out_color = vec4(pow(color, vec3(1/2.2)), 1.0);
    } else {
        out_color = vec4(bg, 1.0);
    }
}

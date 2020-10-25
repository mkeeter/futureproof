#version 450
#pragma shader_stage(fragment)
#extension GL_EXT_scalar_block_layout : require

layout(location=0) in  vec2 v_tex_coords;
layout(location=0) out vec4 outColor;

// TODO: put this in a header file so it can be shared
struct Glyph {
    uint x0, y0, width, height;
    int x_offset, y_offset;
};
struct AtlasUniforms {
    Glyph glyphs[128];
    uint glyph_advance;
};
struct Uniforms {
    uint width;
    uint height;
    AtlasUniforms font;
};

layout(set=0, binding=0) uniform texture2D t_diffuse;
layout(set=0, binding=1) uniform sampler s_diffuse;
layout(set=0, binding=2, std430) uniform _Uniforms {
    Uniforms u;
};

void main() {
    float t = texture(sampler2D(t_diffuse, s_diffuse), v_tex_coords).r;
    if (t == 128/255.0) {
        outColor = vec4(gl_FragCoord.x / u.width,
                        gl_FragCoord.y / u.height,
                        0.0, 1.0);
    } else {
        outColor = vec4(t, t, t, 1.0);
    }
}

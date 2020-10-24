#version 450
#pragma shader_stage(fragment)

layout(location=0) in  vec2 v_tex_coords;
layout(location=0) out vec4 outColor;

layout(set=0, binding=0) uniform texture2D t_diffuse;
layout(set=0, binding=1) uniform sampler s_diffuse;
layout(set=0, binding=2) uniform Uniforms {
    uint u_width;
    uint u_height;
};

void main() {
    float t = texture(sampler2D(t_diffuse, s_diffuse), v_tex_coords).r;
    if (t == 128/255.0) {
        outColor = vec4(gl_FragCoord.x / u_width,
                        gl_FragCoord.y / u_height,
                        0.0, 1.0);
    } else {
        outColor = vec4(t, t, t, 1.0);
    }
}

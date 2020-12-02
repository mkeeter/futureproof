#version 450
#pragma shader_stage(fragment)
#extension GL_EXT_scalar_block_layout : require
#include "extern/futureproof.h"

layout(location=0) in vec2 v_tex_coords;

layout(set=0, binding=0) uniform texture2D preview_tex;
layout(set=0, binding=1) uniform sampler preview_sampler;

layout(location=0) out vec4 out_color;

void main() {
    out_color = texture(sampler2D(preview_tex, preview_sampler), v_tex_coords);
}

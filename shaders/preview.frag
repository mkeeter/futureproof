#version 440
#extension GL_EXT_scalar_block_layout : require
#include "extern/preview.h"
layout(set=0, binding=0, std430) uniform Uniforms {
    FP_PREVIEW_UNIFORMS
};
layout(location=0) out vec4 fragColor_;
void mainImage(out vec4 fragColor, in vec2 fragCoord);
void main()  {
    vec4 o;
    mainImage(o, gl_FragCoord.xy);
    fragColor_ = o;
}

////////////////////////////////////////////////////////////////////////////////
// Drop shader code below:

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    fragColor = vec4(1, 0, 1, 1);
}

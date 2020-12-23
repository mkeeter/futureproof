#include "extern/compat.h"

#define FP_PREVIEW_UNIFORMS \
    vec3 iResolution; \
    float iTime; \
    vec4 iMouse; \
    uint32_t _tiles_per_side; \
    uint32_t _tile_num; \

struct fpPreviewUniforms {
    FP_PREVIEW_UNIFORMS
};

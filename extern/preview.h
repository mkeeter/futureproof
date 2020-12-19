#if GL_core_profile
// Compiling as GLSL
#define uint32_t uint
#else
#include <stdint.h>
// Compiling as a C header file
typedef struct {
    float x, y, z;
} vec3;
typedef struct {
    float x, y, z, w;
} vec4;
#endif

#define FP_PREVIEW_UNIFORMS \
    vec3 iResolution; \
    float iTime; \
    vec4 iMouse; \
    uint32_t _tiles_per_side; \
    uint32_t _tile_num; \


struct fpPreviewUniforms {
    FP_PREVIEW_UNIFORMS
};

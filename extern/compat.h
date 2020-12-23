#if GL_core_profile // Compiling as GLSL
#define uint32_t uint
#define int32_t int
#define MEMBER_STRUCT

#else // Compiling as a C header file
#pragma once
#include <stdint.h>
#define MEMBER_STRUCT struct
// Compiling as a C header file
typedef struct {
    float x, y, z;
} vec3;
typedef struct {
    float x, y, z, w;
} vec4;
#endif

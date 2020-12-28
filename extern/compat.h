// This is a shim which should be included in any header that's included
// in both C / Zig and GLSL.  It allows headers to work around missing
// sized integer types (in GLSL), vec types (in C), and slightly different
// handling of struct naming (using the MEMBER_STRUCT macro).
#pragma once

#if GL_core_profile // Compiling as GLSL
#define uint32_t uint
#define int32_t int
#define MEMBER_STRUCT

#else // Compiling as a C header file
#include <stdint.h>
#define MEMBER_STRUCT struct
typedef struct {
    float x, y, z;
} vec3;
typedef struct {
    float x, y, z, w;
} vec4;
#endif

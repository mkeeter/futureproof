#if GL_core_profile
// Compiling as GLSL
#define uint32_t uint
#define int32_t int
#define MEMBER_STRUCT
#else
// Compiling as a C header file
#include <stdint.h>
#define MEMBER_STRUCT struct
#endif

struct fpGlyph {
    uint32_t x0, y0, width, height;
    int32_t x_offset, y_offset;
};
struct fpAtlasUniforms {
    MEMBER_STRUCT fpGlyph glyphs[128];
    uint32_t glyph_height;
    uint32_t glyph_advance;
    uint32_t glyph_z_offset;
};
struct fpUniforms {
    uint32_t width_px;
    uint32_t height_px;
    uint32_t x_tiles;
    uint32_t y_tiles;
    MEMBER_STRUCT fpAtlasUniforms font;
};

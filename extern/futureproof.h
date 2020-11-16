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
    MEMBER_STRUCT fpGlyph glyphs[256];
    uint32_t glyph_height;
    uint32_t glyph_advance;
};

#define FP_FLAG_BOLD          (1 << 0)
#define FP_FLAG_ITALIC        (1 << 1)
#define FP_FLAG_REVERSE       (1 << 2)
#define FP_FLAG_UNDERCURL     (1 << 3)
#define FP_FLAG_UNDERLINE     (1 << 4)
#define FP_FLAG_STRIKETHROUGH (1 << 5)

struct fpHlAttrs {
    uint32_t foreground;
    uint32_t background;
    uint32_t special;
    uint32_t flags; // Set of FP_FLAGs above
};
#define FP_CURSOR_BLOCK 0
#define FP_CURSOR_VERTICAL 1
#define FP_CURSOR_HORIZONTAL 2
struct fpMode {
    uint32_t cursor_shape; // One of the FP_CURSORs above
    uint32_t cell_percentage;

    uint32_t blinkwait;
    uint32_t blinkon;
    uint32_t blinkoff;

    uint32_t attr_id;
    uint32_t attr_id_lm;
};

#define FP_MAX_MODES 32
#define FP_MAX_ATTRS 256
struct fpUniforms {
    uint32_t width_px;
    uint32_t height_px;
    MEMBER_STRUCT fpAtlasUniforms font;
    MEMBER_STRUCT fpHlAttrs attrs[FP_MAX_ATTRS];
    MEMBER_STRUCT fpMode modes[FP_MAX_MODES];
};

const std = @import("std");
const c = @import("c.zig");

const Atlas = struct {
    u: c.fpAtlasUniforms,
    tex: []u8,
    tex_size: u32,
};

pub fn build_atlas(alloc: *std.mem.Allocator, comptime font_name: []const u8, font_size: u32, tex_size: u32) !Atlas {
    var ft: c.FT_Library = null;
    var face: c.FT_Face = null;

    try status_to_err(c.FT_Init_FreeType(&ft));
    defer status_to_err(c.FT_Done_FreeType(ft)) catch |err| {
        std.debug.panic("Could not destroy library: {}", .{err});
    };

    try status_to_err(c.FT_New_Face(ft, font_name.ptr, 0, &face));
    try status_to_err(c.FT_Set_Pixel_Sizes(face, @intCast(c_uint, font_size), @intCast(c_uint, font_size)));

    // Track position within the texture atlas
    var x: u32 = 1;
    var y: u32 = 1;
    var max_height: u32 = 0;

    const tex = try std.heap.c_allocator.alloc(u8, tex_size * tex_size);
    std.mem.set(u8, tex, 128);
    var out = Atlas{
        .tex = tex,
        .tex_size = tex_size,
        .u = undefined,
    };
    out.u.glyph_height = font_size;

    var i: u8 = 0;
    while (i < 128) : (i += 1) {
        try status_to_err(c.FT_Load_Char(face, i, c.FT_LOAD_RENDER | c.FT_LOAD_TARGET_LIGHT));
        const bmp = &(face.*.glyph.*.bitmap);

        { // Store the glyph advance
            const g = @intCast(u32, face.*.glyph.*.advance.x >> 6);
            if (i == 0) {
                out.u.glyph_advance = g;
            } else if (g != out.u.glyph_advance) {
                std.debug.panic("Inconsistent glyph advance; is font not fixed-width?", .{});
            }
        }

        // Reset to the beginning of the line
        if (x + bmp.*.width >= tex_size) {
            y += max_height;
            x = 1;
            max_height = 0;
        }
        if (y + bmp.*.rows >= tex_size) {
            std.debug.panic("Ran out of atlas space", .{});
        } else if (bmp.*.rows > max_height) {
            max_height = bmp.*.rows;
        }
        var row: usize = 0;
        const pitch: usize = @intCast(usize, bmp.*.pitch);
        while (row < bmp.*.rows) : (row += 1) {
            var col: usize = 0;
            while (col < bmp.*.width) : (col += 1) {
                const p: u8 = bmp.*.buffer[row * pitch + col];
                out.tex[x + col + tex_size * (row + y)] = p;
            }
        }
        out.u.glyphs[i] = c.fpGlyph{
            .x0 = x,
            .y0 = y,
            .width = bmp.*.width,
            .height = bmp.*.rows,
            .x_offset = face.*.glyph.*.bitmap_left,
            .y_offset = face.*.glyph.*.bitmap_top,
        };

        x += bmp.*.width;
    }

    return out;
}

////////////////////////////////////////////////////////////////////////////////
// TODO: generate all of this at comptime
const Error = error{
    // Ok = 0
    CannotOpenResource,
    UnknownFileFormat,
    InvalidFileFormat,
    InvalidVersion,
    LowerModuleVersion,
    InvalidArgument,
    UnimplementedFeature,
    InvalidTable,
    InvalidOffset,
    ArrayTooLarge,
    MissingModule,
    MissingProperty,

    // glyph/character errors

    InvalidGlyphIndex,
    InvalidCharacterCode,
    InvalidGlyphFormat,
    CannotRenderGlyph,
    InvalidOutline,
    InvalidComposite,
    TooManyHints,
    InvalidPixelSize,

    // handle errors

    InvalidHandle,
    InvalidLibraryHandle,
    InvalidDriverHandle,
    InvalidFaceHandle,
    InvalidSizeHandle,
    InvalidSlotHandle,
    InvalidCharMapHandle,
    InvalidCacheHandle,
    InvalidStreamHandle,

    // driver errors

    TooManyDrivers,
    TooManyExtensions,

    // memory errors

    OutOfMemory,
    UnlistedObject,

    // stream errors

    CannotOpenStream,
    InvalidStreamSeek,
    InvalidStreamSkip,
    InvalidStreamRead,
    InvalidStreamOperation,
    InvalidFrameOperation,
    NestedFrameAccess,
    InvalidFrameRead,

    // raster errors

    RasterUninitialized,
    RasterCorrupted,
    RasterOverflow,
    RasterNegativeHeight,

    // cache errors

    TooManyCaches,

    // TrueType and SFNT errors

    InvalidOpcode,
    TooFewArguments,
    StackOverflow,
    CodeOverflow,
    BadArgument,
    DivideByZero,
    InvalidReference,
    DebugOpCode,
    ENDFInExecStream,
    NestedDEFS,
    InvalidCodeRange,
    ExecutionTooLong,
    TooManyFunctionDefs,
    TooManyInstructionDefs,
    TableMissing,
    HorizHeaderMissing,
    LocationsMissing,
    NameTableMissing,
    CMapTableMissing,
    HmtxTableMissing,
    PostTableMissing,
    InvalidHorizMetrics,
    InvalidCharMapFormat,
    InvalidPPem,
    InvalidVertMetrics,
    CouldNotFindContext,
    InvalidPostTableFormat,
    InvalidPostTable,
    DEFInGlyfBytecode,
    MissingBitmap,

    // CFF, CID, and Type 1 errors

    SyntaxError,
    StackUnderflow,
    Ignore,
    NoUnicodeGlyphName,
    GlyphTooBig,

    // BDF errors

    MissingStartfontField,
    MissingFontField,
    MissingSizeField,
    MissingFontboundingboxField,
    MissingCharsField,
    MissingStartcharField,
    MissingEncodingField,
    MissingBbxField,
    BbxTooBig,
    CorruptedFontHeader,
    CorruptedFontGlyphs,

    // This is an extra error (not from FreeType), if the int isn't known
    UnknownError,
};
fn status_to_err(i: c_int) Error!void {
    switch (i) {
        c.FT_Err_Ok => return,

        c.FT_Err_Cannot_Open_Resource => return error.CannotOpenResource,
        c.FT_Err_Unknown_File_Format => return error.UnknownFileFormat,
        c.FT_Err_Invalid_File_Format => return error.InvalidFileFormat,
        c.FT_Err_Invalid_Version => return error.InvalidVersion,
        c.FT_Err_Lower_Module_Version => return error.LowerModuleVersion,
        c.FT_Err_Invalid_Argument => return error.InvalidArgument,
        c.FT_Err_Unimplemented_Feature => return error.UnimplementedFeature,
        c.FT_Err_Invalid_Table => return error.InvalidTable,
        c.FT_Err_Invalid_Offset => return error.InvalidOffset,
        c.FT_Err_Array_Too_Large => return error.ArrayTooLarge,
        c.FT_Err_Missing_Module => return error.MissingModule,
        c.FT_Err_Missing_Property => return error.MissingProperty,

        // glyph/character errors

        c.FT_Err_Invalid_Glyph_Index => return error.InvalidGlyphIndex,
        c.FT_Err_Invalid_Character_Code => return error.InvalidCharacterCode,
        c.FT_Err_Invalid_Glyph_Format => return error.InvalidGlyphFormat,
        c.FT_Err_Cannot_Render_Glyph => return error.CannotRenderGlyph,
        c.FT_Err_Invalid_Outline => return error.InvalidOutline,
        c.FT_Err_Invalid_Composite => return error.InvalidComposite,
        c.FT_Err_Too_Many_Hints => return error.TooManyHints,
        c.FT_Err_Invalid_Pixel_Size => return error.InvalidPixelSize,

        // handle errors

        c.FT_Err_Invalid_Handle => return error.InvalidHandle,
        c.FT_Err_Invalid_Library_Handle => return error.InvalidLibraryHandle,
        c.FT_Err_Invalid_Driver_Handle => return error.InvalidDriverHandle,
        c.FT_Err_Invalid_Face_Handle => return error.InvalidFaceHandle,
        c.FT_Err_Invalid_Size_Handle => return error.InvalidSizeHandle,
        c.FT_Err_Invalid_Slot_Handle => return error.InvalidSlotHandle,
        c.FT_Err_Invalid_CharMap_Handle => return error.InvalidCharMapHandle,
        c.FT_Err_Invalid_Cache_Handle => return error.InvalidCacheHandle,
        c.FT_Err_Invalid_Stream_Handle => return error.InvalidStreamHandle,

        // driver errors

        c.FT_Err_Too_Many_Drivers => return error.TooManyDrivers,
        c.FT_Err_Too_Many_Extensions => return error.TooManyExtensions,

        // memory errors

        c.FT_Err_Out_Of_Memory => return error.OutOfMemory,
        c.FT_Err_Unlisted_Object => return error.UnlistedObject,

        // stream errors

        c.FT_Err_Cannot_Open_Stream => return error.CannotOpenStream,
        c.FT_Err_Invalid_Stream_Seek => return error.InvalidStreamSeek,
        c.FT_Err_Invalid_Stream_Skip => return error.InvalidStreamSkip,
        c.FT_Err_Invalid_Stream_Read => return error.InvalidStreamRead,
        c.FT_Err_Invalid_Stream_Operation => return error.InvalidStreamOperation,
        c.FT_Err_Invalid_Frame_Operation => return error.InvalidFrameOperation,
        c.FT_Err_Nested_Frame_Access => return error.NestedFrameAccess,
        c.FT_Err_Invalid_Frame_Read => return error.InvalidFrameRead,

        // raster errors

        c.FT_Err_Raster_Uninitialized => return error.RasterUninitialized,
        c.FT_Err_Raster_Corrupted => return error.RasterCorrupted,
        c.FT_Err_Raster_Overflow => return error.RasterOverflow,
        c.FT_Err_Raster_Negative_Height => return error.RasterNegativeHeight,

        // cache errors

        c.FT_Err_Too_Many_Caches => return error.TooManyCaches,

        // TrueType and SFNT errors

        c.FT_Err_Invalid_Opcode => return error.InvalidOpcode,
        c.FT_Err_Too_Few_Arguments => return error.TooFewArguments,
        c.FT_Err_Stack_Overflow => return error.StackOverflow,
        c.FT_Err_Code_Overflow => return error.CodeOverflow,
        c.FT_Err_Bad_Argument => return error.BadArgument,
        c.FT_Err_Divide_By_Zero => return error.DivideByZero,
        c.FT_Err_Invalid_Reference => return error.InvalidReference,
        c.FT_Err_Debug_OpCode => return error.DebugOpCode,
        c.FT_Err_ENDF_In_Exec_Stream => return error.ENDFInExecStream,
        c.FT_Err_Nested_DEFS => return error.NestedDEFS,
        c.FT_Err_Invalid_CodeRange => return error.InvalidCodeRange,
        c.FT_Err_Execution_Too_Long => return error.ExecutionTooLong,
        c.FT_Err_Too_Many_Function_Defs => return error.TooManyFunctionDefs,
        c.FT_Err_Too_Many_Instruction_Defs => return error.TooManyInstructionDefs,
        c.FT_Err_Table_Missing => return error.TableMissing,
        c.FT_Err_Horiz_Header_Missing => return error.HorizHeaderMissing,
        c.FT_Err_Locations_Missing => return error.LocationsMissing,
        c.FT_Err_Name_Table_Missing => return error.NameTableMissing,
        c.FT_Err_CMap_Table_Missing => return error.CMapTableMissing,
        c.FT_Err_Hmtx_Table_Missing => return error.HmtxTableMissing,
        c.FT_Err_Post_Table_Missing => return error.PostTableMissing,
        c.FT_Err_Invalid_Horiz_Metrics => return error.InvalidHorizMetrics,
        c.FT_Err_Invalid_CharMap_Format => return error.InvalidCharMapFormat,
        c.FT_Err_Invalid_PPem => return error.InvalidPPem,
        c.FT_Err_Invalid_Vert_Metrics => return error.InvalidVertMetrics,
        c.FT_Err_Could_Not_Find_Context => return error.CouldNotFindContext,
        c.FT_Err_Invalid_Post_Table_Format => return error.InvalidPostTableFormat,
        c.FT_Err_Invalid_Post_Table => return error.InvalidPostTable,
        c.FT_Err_DEF_In_Glyf_Bytecode => return error.DEFInGlyfBytecode,
        c.FT_Err_Missing_Bitmap => return error.MissingBitmap,

        // CFF, CID, and Type 1 errors

        c.FT_Err_Syntax_Error => return error.SyntaxError,
        c.FT_Err_Stack_Underflow => return error.StackUnderflow,
        c.FT_Err_Ignore => return error.Ignore,
        c.FT_Err_No_Unicode_Glyph_Name => return error.NoUnicodeGlyphName,
        c.FT_Err_Glyph_Too_Big => return error.GlyphTooBig,

        // BDF errors

        c.FT_Err_Missing_Startfont_Field => return error.MissingStartfontField,
        c.FT_Err_Missing_Font_Field => return error.MissingFontField,
        c.FT_Err_Missing_Size_Field => return error.MissingSizeField,
        c.FT_Err_Missing_Fontboundingbox_Field => return error.MissingFontboundingboxField,
        c.FT_Err_Missing_Chars_Field => return error.MissingCharsField,
        c.FT_Err_Missing_Startchar_Field => return error.MissingStartcharField,
        c.FT_Err_Missing_Encoding_Field => return error.MissingEncodingField,
        c.FT_Err_Missing_Bbx_Field => return error.MissingBbxField,
        c.FT_Err_Bbx_Too_Big => return error.BbxTooBig,
        c.FT_Err_Corrupted_Font_Header => return error.CorruptedFontHeader,
        c.FT_Err_Corrupted_Font_Glyphs => return error.CorruptedFontGlyphs,

        else => return error.UnknownError,
    }
}

const std = @import("std");
const c = @import("c.zig");

pub const Atlas = struct {
    const Self = @This();

    alloc: std.mem.Allocator,

    // Font atlas texture
    tex: []u32,
    tex_size: u32,

    // Position within the atlas texture
    x: u32,
    y: u32,
    max_row_height: u32,
    glyph_index: u32,
    has_advance: bool, // is the glyph advance stored in u.glyph_advance?

    // Conversion from codepoint to position in u.glyphs
    table: std.hash_map.AutoHashMapUnmanaged(u32, u32),

    // Freetype state
    ft: c.FT_Library,
    face: c.FT_Face,

    // Uniforms (synchronized with the GPU)
    u: c.fpAtlasUniforms,

    pub fn deinit(self: *Self) void {
        status_to_err(c.FT_Done_FreeType(self.ft)) catch |err| {
            std.debug.panic("Could not destroy library: {}", .{err});
        };
        self.alloc.free(self.tex);
        self.table.deinit(self.alloc);
    }

    pub fn get_glyph(self: *Self, codepoint: u32) ?u32 {
        if (codepoint < 127) {
            return codepoint;
        }
        return self.table.get(codepoint);
    }

    pub fn add_glyph(self: *Self, codepoint: u32) !u32 {
        // New glyphs go at the back of the glyphs table
        const g = self.glyph_index;
        try self.table.put(self.alloc, codepoint, g);
        self.glyph_index += 1;

        const char_index = c.FT_Get_Char_Index(self.face, codepoint);
        if (char_index == 0) {
            std.debug.print("Could not get char for codepoint {x}\n", .{codepoint});
        }
        try status_to_err(c.FT_Load_Glyph(
            self.face,
            char_index,
            0,
        ));
        try status_to_err(c.FT_Render_Glyph(
            self.face.*.glyph,
            //c.FT_Render_Mode.FT_RENDER_MODE_LCD,
            c.FT_RENDER_MODE_LCD,
        ));
        const glyph = self.face.*.glyph;
        const bmp = &(glyph.*.bitmap);

        { // Store the glyph advance
            const advance = @intCast(u32, glyph.*.advance.x >> 6);
            if (!self.has_advance) {
                self.has_advance = true;
                self.u.glyph_advance = advance;
            } else if (advance != self.u.glyph_advance) {
                std.debug.panic("Inconsistent glyph advance; is font not fixed-width?", .{});
            }
        }

        // Calculate true width (ignoring RGB, which triples width)
        const bmp_width = bmp.*.width / 3;

        // Reset to the beginning of the line
        if (self.x + bmp_width >= self.tex_size) {
            self.y += self.max_row_height;
            self.x = 1;
            self.max_row_height = 0;
        }
        if (self.y + bmp.*.rows >= self.tex_size) {
            std.debug.panic("Ran out of atlas space", .{});
        } else if (bmp.*.rows > self.max_row_height) {
            self.max_row_height = bmp.*.rows;
        }
        var row: usize = 0;
        const pitch: usize = @intCast(usize, bmp.*.pitch);
        while (row < bmp.*.rows) : (row += 1) {
            var col: usize = 0;
            while (col < bmp_width) : (col += 1) {
                const p: u32 = 0 |
                    @intCast(u32, bmp.*.buffer[row * pitch + col * 3]) |
                    (@intCast(u32, bmp.*.buffer[row * pitch + col * 3 + 1]) << 8) |
                    (@intCast(u32, bmp.*.buffer[row * pitch + col * 3 + 2]) << 16);
                self.tex[self.x + col + self.tex_size * (row + self.y)] = p;
            }
        }
        const offset = @intCast(i32, self.face.*.size.*.metrics.descender >> 6);
        self.u.glyphs[g] = c.fpGlyph{
            .x0 = self.x,
            .y0 = self.y,
            .width = bmp_width,
            .height = bmp.*.rows,
            .x_offset = glyph.*.bitmap_left,
            .y_offset = glyph.*.bitmap_top - @intCast(i32, bmp.*.rows) - offset,
        };
        self.x += bmp_width;

        return g;
    }
};

pub fn build_atlas(
    alloc: std.mem.Allocator,
    comptime font_name: []const u8,
    font_size: u32,
    tex_size: u32,
) !Atlas {
    const tex = try alloc.alloc(u32, tex_size * tex_size);
    std.mem.set(u32, tex, 128);
    var out = Atlas{
        .alloc = alloc,

        .tex = tex,
        .tex_size = tex_size,

        .x = 1,
        .y = 1,
        .glyph_index = 32,
        .max_row_height = 0,
        .has_advance = false,

        // Freetype handles
        .ft = undefined,
        .face = undefined,

        .table = std.hash_map.AutoHashMapUnmanaged(u32, u32){},

        // GPU uniforms
        .u = undefined,
    };
    out.u.glyph_height = font_size;

    try status_to_err(c.FT_Init_FreeType(&out.ft));
    try status_to_err(c.FT_New_Face(out.ft, font_name.ptr, 0, &out.face));
    try status_to_err(c.FT_Set_Pixel_Sizes(
        out.face,
        @intCast(c_uint, font_size),
        @intCast(c_uint, font_size),
    ));

    var i = out.glyph_index;
    while (i < 127) : (i += 1) {
        _ = try out.add_glyph(i);
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

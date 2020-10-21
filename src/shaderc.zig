const std = @import("std");
const c = @import("c.zig");

// TODO: calculate this whole error and function below at comptime
const CompilationError = error{
    // Success = 0
    InvalidStage,
    CompilationError,
    InternalError,
    NullResultObject,
    InvalidAssembly,
    ValidationError,
    TransformationError,
    ConfigurationError,

    UnknownError,
};
fn status_to_err(i: c_int) CompilationError {
    switch (i) {
        c.shaderc_compilation_status_invalid_stage => return CompilationError.InvalidStage,
        c.shaderc_compilation_status_compilation_error => return CompilationError.CompilationError,
        c.shaderc_compilation_status_internal_error => return CompilationError.InternalError,
        c.shaderc_compilation_status_null_result_object => return CompilationError.NullResultObject,
        c.shaderc_compilation_status_invalid_assembly => return CompilationError.InvalidAssembly,
        c.shaderc_compilation_status_validation_error => return CompilationError.ValidationError,
        c.shaderc_compilation_status_transformation_error => return CompilationError.TransformationError,
        c.shaderc_compilation_status_configuration_error => return CompilationError.ConfigurationError,
        else => return CompilationError.UnknownError,
    }
}

pub fn build_shader_from_file(alloc: *std.mem.Allocator, comptime name: []const u8) ![]u32 {
    const file = try std.fs.cwd().openFile(name, std.fs.File.OpenFlags{ .read = true });
    const size = try file.getEndPos();
    const buf = try alloc.alloc(u8, size);
    defer alloc.free(buf);
    _ = try file.readAll(buf);
    return build_shader(alloc, name, buf);
}

pub fn build_shader(alloc: *std.mem.Allocator, name: []const u8, src: []const u8) ![]u32 {
    const compiler = c.shaderc_compiler_initialize();
    defer c.shaderc_compiler_release(compiler);

    const result = c.shaderc_compile_into_spv(compiler, src.ptr, src.len, @intToEnum(c.shaderc_shader_kind, c.shaderc_glsl_infer_from_source), name.ptr, "main", null);
    defer c.shaderc_result_release(result);
    const r = c.shaderc_result_get_compilation_status(result);
    if (@enumToInt(r) != c.shaderc_compilation_status_success) {
        const err = c.shaderc_result_get_error_message(result);
        std.debug.warn("Shader error in {s}", .{err});
        return status_to_err(@enumToInt(r));
    }

    // Copy the result out of the shader
    const len = c.shaderc_result_get_length(result);
    std.debug.assert(len % 4 == 0);
    const out = alloc.alloc(u32, len / 4) catch unreachable;
    @memcpy(@ptrCast([*]u8, out.ptr), c.shaderc_result_get_bytes(result), len);

    return out;
}

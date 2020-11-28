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

export fn include_cb(user_data: ?*c_void, requested_source: [*c]const u8, include_type: c_int, requesting_source: [*c]const u8, include_depth: usize) *c.shaderc_include_result {
    const alloc = @ptrCast(*std.mem.Allocator, @alignCast(8, user_data));
    var out = alloc.create(c.shaderc_include_result) catch |err| {
        std.debug.panic("Could not allocate shaderc_include_result: {}", .{err});
    };
    out.* = (c.shaderc_include_result){
        .user_data = user_data,
        .source_name = "",
        .source_name_length = 0,
        .content = null,
        .content_length = 0,
    };

    const name = std.mem.spanZ(requested_source);
    const file = std.fs.cwd().openFile(name, std.fs.File.OpenFlags{ .read = true }) catch |err| {
        const msg = std.fmt.allocPrint(alloc, "{}", .{err}) catch |err2| {
            std.debug.panic("Could not allocate error message: {}", .{err2});
        };
        out.content = msg.ptr;
        out.content_length = msg.len;

        return out;
    };

    const size = file.getEndPos() catch |err| {
        std.debug.panic("Could not get end position of file: {}", .{err});
    };
    const buf = alloc.alloc(u8, size) catch |err| {
        std.debug.panic("Could not allocate space for data: {}", .{err});
    };
    _ = file.readAll(buf) catch |err| {
        std.debug.panic("Could not read header: {}", .{err});
    };

    out.source_name = requested_source;
    out.source_name_length = name.len;
    out.content = buf.ptr;
    out.content_length = buf.len;
    return out;
}

export fn include_release_cb(user_data: ?*c_void, include_result: ?*c.shaderc_include_result) void {
    if (include_result != null) {
        const alloc = @ptrCast(*std.mem.Allocator, @alignCast(8, user_data));
        const r = @ptrCast(*c.shaderc_include_result, include_result);
        if (r.*.content != null) {
            alloc.destroy(r.*.content);
        }
        alloc.destroy(r);
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

    const options = c.shaderc_compile_options_initialize();
    c.shaderc_compile_options_set_include_callbacks(options, include_cb, include_release_cb, alloc);

    const result = c.shaderc_compile_into_spv(
        compiler,
        src.ptr,
        src.len,
        c.shaderc_shader_kind.shaderc_glsl_infer_from_source,
        name.ptr,
        "main",
        options,
    );
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

////////////////////////////////////////////////////////////////////////////////

pub const Error = struct {
    msg: []const u8,
    code: c.shaderc_compilation_status,
};
pub const Result = union(enum) {
    Shader: []const u32,
    Error: Error,

    pub fn deinit(self: Result, alloc: *std.mem.Allocator) void {
        switch (self) {
            .Shader => |d| alloc.free(d),
            .Error => |e| alloc.free(e.msg),
        }
    }
};

pub fn build_preview_shader(alloc: *std.mem.Allocator, src: []const u8) Result {
    const compiler = c.shaderc_compiler_initialize();
    defer c.shaderc_compiler_release(compiler);

    const options = c.shaderc_compile_options_initialize();
    c.shaderc_compile_options_set_include_callbacks(
        options,
        include_cb,
        include_release_cb,
        alloc,
    );

    const result = c.shaderc_compile_into_spv(
        compiler,
        src.ptr,
        src.len,
        c.shaderc_shader_kind.shaderc_glsl_fragment_shader,
        "preview",
        "main",
        options,
    );
    defer c.shaderc_result_release(result);

    const r = c.shaderc_result_get_compilation_status(result);
    if (@enumToInt(r) != c.shaderc_compilation_status_success) {
        // Copy the error out of the shader
        const err_msg = c.shaderc_result_get_error_message(result);
        const len = std.mem.len(err_msg);
        const out = alloc.alloc(u8, len) catch unreachable;
        @memcpy(out.ptr, err_msg, len);

        // Prase out individual lines of the error message, figuring out
        // which ones have a line number attached.
        var start: usize = 0;
        while (std.mem.indexOf(u8, out[start..], "\n")) |end| {
            const line = out[start..(start + end)];
            start += end + 1;

            const num_start = std.mem.indexOf(u8, line, ":") orelse std.debug.panic("Could not find ':' in error message", .{});
            const num_end = num_start + 1 + (std.mem.indexOf(u8, line[(num_start + 1)..], " ") orelse std.debug.panic("Could not find ':' in error message", .{}));

            if (num_end >= num_start + 2) {
                // Error message with line attached
                std.debug.print("{s}: {}\n", .{
                    line[(num_start + 1)..(num_end - 1)],
                    line[(num_end + 1)..],
                });
            } else {
                std.debug.print("{s}\n", .{line[(num_start + 2)..]});
            }
        }

        //std.fmt.parseInt
        return Result{ .Error = .{ .msg = out, .code = r } };
    } else {
        // Copy the result out of the shader
        const len = c.shaderc_result_get_length(result);
        std.debug.assert(len % 4 == 0);
        const out = alloc.alloc(u32, len / 4) catch unreachable;
        @memcpy(@ptrCast([*]u8, out.ptr), c.shaderc_result_get_bytes(result), len);
        return Result{ .Shader = out };
    }
}

const std = @import("std");

const c = @import("c.zig");
const util = @import("util.zig");

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
fn status_to_err(i: c_uint) CompilationError {
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

export fn include_cb(user_data: ?*anyopaque, requested_source: [*c]const u8, include_type: c_int, requesting_source: [*c]const u8, include_depth: usize) *c.shaderc_include_result {
    _ = requesting_source;
    _ = include_type;
    _ = include_depth;

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

    const name = std.mem.span(requested_source);
    const file = std.fs.cwd().openFile(name, std.fs.File.OpenFlags{ .mode = .read_only }) catch |err| {
        const msg = std.fmt.allocPrint(alloc.*, "{}", .{err}) catch |err2| {
            std.debug.panic("Could not allocate error message: {}", .{err2});
        };
        out.content = msg.ptr;
        out.content_length = msg.len;

        return out;
    };
    defer file.close();

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

export fn include_release_cb(user_data: ?*anyopaque, include_result: ?*c.shaderc_include_result) void {
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
    const buf = try util.file_contents(alloc.*, name);
    return build_shader(alloc, name, buf);
}

pub fn build_shader(alloc: *std.mem.Allocator, name: []const u8, src: []const u8) ![]u32 {
    const compiler = c.shaderc_compiler_initialize();
    defer c.shaderc_compiler_release(compiler);

    const options = c.shaderc_compile_options_initialize();
    defer c.shaderc_compile_options_release(options);
    c.shaderc_compile_options_set_include_callbacks(options, include_cb, include_release_cb, alloc);

    const result = c.shaderc_compile_into_spv(
        compiler,
        src.ptr,
        src.len,
        c.shaderc_glsl_infer_from_source,
        name.ptr,
        "main",
        options,
    );
    defer c.shaderc_result_release(result);
    const r = c.shaderc_result_get_compilation_status(result);
    if (r != c.shaderc_compilation_status_success) {
        const err = c.shaderc_result_get_error_message(result);
        std.debug.print("Shader error: {} {s}\n", .{ r, err });
        return status_to_err(r);
    }

    // Copy the result out of the shader
    const len = c.shaderc_result_get_length(result);
    std.debug.assert(len % 4 == 0);
    const out = alloc.alloc(u32, len / 4) catch unreachable;
    @memcpy(@ptrCast([*]u8, out.ptr), c.shaderc_result_get_bytes(result), len);

    return out;
}

////////////////////////////////////////////////////////////////////////////////

pub const LineErr = struct {
    msg: []const u8,
    line: ?u32,
};
pub const Error = struct {
    errs: []const LineErr,
    code: c.shaderc_compilation_status,
};
pub const Shader = struct {
    spirv: []const u32,
    has_time: bool,
};

pub const Result = union(enum) {
    Shader: Shader,
    Error: Error,

    pub fn deinit(self: Result, alloc: std.mem.Allocator) void {
        switch (self) {
            .Shader => |d| alloc.free(d.spirv),
            .Error => |e| {
                for (e.errs) |r| {
                    alloc.free(r.msg);
                }
                alloc.free(e.errs);
            },
        }
    }
};

pub fn build_preview_shader(
    alloc: std.mem.Allocator,
    compiler: c.shaderc_compiler_t,
    src: []const u8,
) !Result {
    // Load the standard fragment shader prelude from a file
    // (or embed in the source if this is a release build)
    var arena = std.heap.ArenaAllocator.init(alloc);
    defer arena.deinit();
    var tmp_alloc = arena.allocator();
    const prelude = try util.file_contents(
        tmp_alloc,
        "shaders/preview.prelude.frag",
    );

    const full_src = try tmp_alloc.alloc(u8, prelude.len + src.len);
    std.mem.copy(u8, full_src, prelude);
    std.mem.copy(u8, full_src[prelude.len..], src);

    const options = c.shaderc_compile_options_initialize();
    c.shaderc_compile_options_set_include_callbacks(
        options,
        include_cb,
        include_release_cb,
        &tmp_alloc,
    );
    defer c.shaderc_compile_options_release(options);

    const result = c.shaderc_compile_into_spv(
        compiler,
        full_src.ptr,
        full_src.len,
        c.shaderc_glsl_fragment_shader,
        "preview",
        "main",
        options,
    );
    defer c.shaderc_result_release(result);

    const r = c.shaderc_result_get_compilation_status(result);
    if (r != c.shaderc_compilation_status_success) {
        var start: usize = 0;
        var prelude_newlines: u32 = 0;
        while (std.mem.indexOf(u8, prelude[start..], "\n")) |end| {
            prelude_newlines += 1;
            start += end + 1;
        }

        // Copy the error out of the shader
        const err_msg = c.shaderc_result_get_error_message(result);
        const len = std.mem.len(err_msg);
        const out = try tmp_alloc.alloc(u8, len);
        @memcpy(out.ptr, err_msg, len);

        // Prase out individual lines of the error message, figuring out
        // which ones have a line number attached.
        start = 0;
        var errs = std.ArrayList(LineErr).init(alloc);
        while (std.mem.indexOf(u8, out[start..], "\n")) |end| {
            const line = out[start..(start + end)];
            start += end + 1;

            const num_start = std.mem.indexOf(u8, line, ":") orelse std.debug.panic(
                "Could not find ':' in error message",
                .{},
            );
            const num_end = num_start + 1 + (std.mem.indexOf(
                u8,
                line[(num_start + 1)..],
                " ",
            ) orelse std.debug.panic("Could not find ':' in error message", .{}));

            if (num_end >= num_start + 2) {
                // Error message with line attached
                var line_num = try std.fmt.parseInt(u32, line[(num_start + 1)..(num_end - 1)], 10);
                line_num = if (line_num < prelude_newlines) 1 else (line_num - prelude_newlines);
                const line_msg = try alloc.dupe(u8, line[(num_end + 1)..]);
                try errs.append(.{
                    .msg = line_msg,
                    .line = line_num,
                });
            } else {
                const line_msg = try alloc.dupe(u8, line[(num_start + 2)..]);
                try errs.append(.{
                    .msg = line_msg,
                    .line = null,
                });
            }
        }

        return Result{ .Error = .{ .errs = errs.toOwnedSlice(), .code = r } };
    } else {
        // Copy the result out of the shader
        const len = c.shaderc_result_get_length(result);
        std.debug.assert(len % 4 == 0);
        const out = try alloc.alloc(u32, len / 4);
        @memcpy(@ptrCast([*]u8, out.ptr), c.shaderc_result_get_bytes(result), len);

        // Find the text "iTime" in the script, then walk backwards until you
        // see the either the beginning of the line or a comment (//)
        //
        // This prevents the template from running, though folks could still
        // put iTime into a /* ... */ block, which would falsely trigger
        // continously-running mode.
        var has_time = false;
        var start: usize = 0;
        while (std.mem.indexOf(u8, src[start..], "iTime")) |next| {
            has_time = true;
            var i = next;
            while (i > 0) : (i -= 1) {
                if (src[start + i] == '\n') {
                    break;
                } else if (src[start + i - 1] == '/' and src[start + i] == '/') {
                    has_time = false;
                    break;
                }
            }
            if (has_time) {
                break;
            }
            start += next + 1;
        }
        return Result{
            .Shader = .{ .spirv = out, .has_time = has_time },
        };
    }
}

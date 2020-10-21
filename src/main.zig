const builtin = @import("builtin");
const std = @import("std");
const c = @cImport({
    // GLFW
    @cInclude("GLFW/glfw3.h");
    if (builtin.os.tag == builtin.Os.Tag.macos) {
        @cDefine("GLFW_EXPOSE_NATIVE_COCOA", {});
    }
    @cInclude("GLFW/glfw3native.h");

    // Freetype
    @cInclude("ft2build.h");
    @cInclude("freetype/freetype.h");

    @cInclude("wgpu/wgpu.h");
    @cInclude("shaderc/shaderc.h");
});

fn build_shader_from_file(comptime name: []const u8) ![]u32 {
    const file = try std.fs.cwd().openFile(name, std.fs.File.OpenFlags{ .read = true });
    const size = try file.getEndPos();
    const buf = try std.heap.c_allocator.alloc(u8, size);
    defer std.heap.c_allocator.free(buf);
    _ = try file.readAll(buf);
    return build_shader(name, buf);
}

fn build_shader(name: []const u8, src: []const u8) []u32 {
    const compiler = c.shaderc_compiler_initialize();
    defer c.shaderc_compiler_release(compiler);

    const result = c.shaderc_compile_into_spv(compiler, src.ptr, src.len, @intToEnum(c.shaderc_shader_kind, c.shaderc_glsl_infer_from_source), name.ptr, "main", null);
    defer c.shaderc_result_release(result);
    if (@enumToInt(c.shaderc_result_get_compilation_status(result)) != 0) {
        const err = c.shaderc_result_get_error_message(result);
        std.debug.panic("Shader error in {s}", .{err});
    }

    const len = c.shaderc_result_get_length(result);
    const out = std.heap.c_allocator.alloc(u32, (len + 3) / 4) catch unreachable;
    const ptr = c.shaderc_result_get_bytes(result);
    @memcpy(@ptrCast([*]u8, out.ptr), ptr, len);

    return out;
}

fn ft_test() void {
    var ft: c.FT_Library = null;
    var face: c.FT_Face = null;

    if (c.FT_Init_FreeType(&ft) != 0) {
        std.debug.panic("Could not initialize FreeType", .{});
    }
    if (c.FT_New_Face(ft, "font/Inconsolata-Regular.ttf", 0, &face) != 0) {
        std.debug.panic("Could not create face", .{});
    }
    if (c.FT_Set_Char_Size(face, 0, 24 << 6, 96, 96) != 0) {
        std.debug.panic("Could not set char size", .{});
    }

    var i: u32 = 0;
    while (i < 128) {
        _ = c.FT_Load_Char(face, i, c.FT_LOAD_RENDER | c.FT_LOAD_FORCE_AUTOHINT | c.FT_LOAD_TARGET_LIGHT);
        const bmp = &(face.*.glyph.*.bitmap);
        var row: usize = 0;
        const pitch: usize = @intCast(usize, bmp.*.pitch);
        while (row < bmp.*.rows) : (row += 1) {
            var col: usize = 0;
            while (col < bmp.*.width) : (col += 1) {
                const p = bmp.*.buffer[row * pitch + col];
                if (p > 0) {
                    std.debug.print("X", .{});
                } else {
                    std.debug.print(" ", .{});
                }
            }
            std.debug.print("\n", .{});
        }
        std.debug.print("\n", .{});
        i += 1;
    }
}

fn get_surface(window: ?*c.GLFWwindow) c.WGPUSurfaceId {
    const platform = builtin.os.tag;
    if (platform == builtin.Os.Tag.macos) {
        // We import this separately because glfw3native.h defines id as void*,
        // while objc/runtime.h defines it as a struct*, so we have to cast
        const o = @cImport({
            @cInclude("objc/runtime.h");
            @cInclude("objc/message.h");
        });

        const cocoa_window = c.glfwGetCocoaWindow(window);
        const ns_window = @ptrCast(o.id, @alignCast(8, cocoa_window));

        // Time to do hilarious Objective-C runtime hacks, equivalent to
        //  [ns_window.contentView setWantsLayer:YES];
        //  id metal_layer = [CAMetalLayer layer];
        //  [ns_window.contentView setLayer:metal_layer];
        const cv = o.objc_msgSend(ns_window, o.sel_getUid("contentView"));
        _ = o.objc_msgSend(cv, o.sel_getUid("setWantsLayer:"), true);

        const ca_metal = @ptrCast(o.id, o.objc_lookUpClass("CAMetalLayer"));
        const metal_layer = o.objc_msgSend(ca_metal, o.sel_getUid("layer"));

        _ = o.objc_msgSend(cv, o.sel_getUid("setLayer:"), metal_layer);

        return c.wgpu_create_surface_from_metal_layer(metal_layer);
    } else {
        std.debug.panic("Unimplemented on platform {}", .{platform});
    }
}

export fn adapter_cb(received: c.WGPUAdapterId, data: ?*c_void) void {
    @ptrCast(*c.WGPUAdapterId, @alignCast(8, data)).* = received;
}

pub fn main() anyerror!void {
    ft_test();

    if (c.glfwInit() != c.GLFW_TRUE) {
        std.debug.panic("Could not initialize glfw", .{});
    }

    const window = c.glfwCreateWindow(640, 480, "hello", null, null);
    defer c.glfwDestroyWindow(window);
    if (window == null) {
        var err_str: [*c]u8 = null;
        const err = c.glfwGetError(&err_str);
        std.debug.panic("Failed to open window: {} ({})", .{ err, err_str });
    }

    const surface = get_surface(window);

    var adapter: c.WGPUAdapterId = 0;
    c.wgpu_request_adapter_async(&(c.WGPURequestAdapterOptions){
        .power_preference = @intToEnum(c.WGPUPowerPreference, c.WGPUPowerPreference_HighPerformance),
        .compatible_surface = surface,
    }, 2 | 4 | 8, false, adapter_cb, &adapter);

    const device = c.wgpu_adapter_request_device(adapter, 0, &(c.WGPUCLimits){
        .max_bind_groups = 1,
    }, true, null);

    // Load the shaders from compiled data
    const vert_spv = build_shader_from_file("data/triangle.vert") catch |err| {
        std.debug.panic("Could not open file", .{});
    };
    const vert_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
        .bytes = vert_spv.ptr,
        .length = vert_spv.len,
    });

    const frag_spv = build_shader_from_file("data/triangle.frag") catch |err| {
        std.debug.panic("Could not open file", .{});
    };
    const frag_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
        .bytes = frag_spv.ptr,
        .length = frag_spv.len,
    });

    const bind_group_layout = c.wgpu_device_create_bind_group_layout(device, &(c.WGPUBindGroupLayoutDescriptor){
        .label = "bind group layout",
        .entries = null,
        .entries_length = 0,
    });
    const bind_group = c.wgpu_device_create_bind_group(device, &(c.WGPUBindGroupDescriptor){
        .label = "bind group",
        .layout = bind_group_layout,
        .entries = null,
        .entries_length = 0,
    });

    const bind_group_layouts = [_]c.WGPUBindGroupId{bind_group_layout};

    const pipeline_layout = c.wgpu_device_create_pipeline_layout(device, &(c.WGPUPipelineLayoutDescriptor){
        .bind_group_layouts = &bind_group_layouts,
        .bind_group_layouts_length = bind_group_layouts.len,
    });

    const render_pipeline = c.wgpu_device_create_render_pipeline(device, &(c.WGPURenderPipelineDescriptor){
        .layout = pipeline_layout,
        .vertex_stage = (c.WGPUProgrammableStageDescriptor){
            .module = vert_shader,
            .entry_point = "main",
        },
        .fragment_stage = &(c.WGPUProgrammableStageDescriptor){
            .module = frag_shader,
            .entry_point = "main",
        },
        .rasterization_state = &(c.WGPURasterizationStateDescriptor){
            .front_face = @intToEnum(c.WGPUFrontFace, c.WGPUFrontFace_Ccw),
            .cull_mode = @intToEnum(c.WGPUCullMode, c.WGPUCullMode_None),
            .depth_bias = 0,
            .depth_bias_slope_scale = 0.0,
            .depth_bias_clamp = 0.0,
        },
        .primitive_topology = @intToEnum(c.WGPUPrimitiveTopology, c.WGPUPrimitiveTopology_TriangleList),
        .color_states = &(c.WGPUColorStateDescriptor){
            .format = @intToEnum(c.WGPUTextureFormat, c.WGPUTextureFormat_Bgra8Unorm),
            .alpha_blend = (c.WGPUBlendDescriptor){
                .src_factor = @intToEnum(c.WGPUBlendFactor, c.WGPUBlendFactor_One),
                .dst_factor = @intToEnum(c.WGPUBlendFactor, c.WGPUBlendFactor_Zero),
                .operation = @intToEnum(c.WGPUBlendOperation, c.WGPUBlendOperation_Add),
            },
            .color_blend = (c.WGPUBlendDescriptor){
                .src_factor = @intToEnum(c.WGPUBlendFactor, c.WGPUBlendFactor_One),
                .dst_factor = @intToEnum(c.WGPUBlendFactor, c.WGPUBlendFactor_Zero),
                .operation = @intToEnum(c.WGPUBlendOperation, c.WGPUBlendOperation_Add),
            },
            .write_mask = c.WGPUColorWrite_ALL,
        },
        .color_states_length = 1,
        .depth_stencil_state = null,
        .vertex_state = (c.WGPUVertexStateDescriptor){
            .index_format = @intToEnum(c.WGPUIndexFormat, c.WGPUIndexFormat_Uint16),
            .vertex_buffers = null,
            .vertex_buffers_length = 0,
        },
        .sample_count = 1,
        .sample_mask = 0,
        .alpha_to_coverage_enabled = false,
    });

    var prev_width: c_int = -1;
    var prev_height: c_int = -1;
    var swap_chain: c.WGPUSwapChainId = 0;
    while (c.glfwWindowShouldClose(window) == 0) {
        var width: c_int = 0;
        var height: c_int = 0;
        c.glfwGetWindowSize(window, &width, &height);
        if ((width != prev_width) or (height != prev_height)) {
            prev_width = width;
            prev_height = height;

            swap_chain = c.wgpu_device_create_swap_chain(device, surface, &(c.WGPUSwapChainDescriptor){
                .usage = c.WGPUTextureUsage_OUTPUT_ATTACHMENT,
                .format = @intToEnum(c.WGPUTextureFormat, c.WGPUTextureFormat_Bgra8Unorm),
                .width = @intCast(u32, width),
                .height = @intCast(u32, height),
                .present_mode = @intToEnum(c.WGPUPresentMode, c.WGPUPresentMode_Fifo),
            });
        }

        const next_texture = c.wgpu_swap_chain_get_next_texture(swap_chain);
        if (next_texture.view_id == 0) {
            std.debug.panic("Cannot acquire next swap chain texture", .{});
        }

        const cmd_encoder = c.wgpu_device_create_command_encoder(device, &(c.WGPUCommandEncoderDescriptor){ .label = "command encoder" });

        const color_attachments = [_]c.WGPURenderPassColorAttachmentDescriptor{
            (c.WGPURenderPassColorAttachmentDescriptor){
                .attachment = next_texture.view_id,
                .resolve_target = 0,
                .channel = (c.WGPUPassChannel_Color){
                    .load_op = @intToEnum(c.WGPULoadOp, c.WGPULoadOp_Clear),
                    .store_op = @intToEnum(c.WGPUStoreOp, c.WGPUStoreOp_Store),
                    .clear_value = (c.WGPUColor){ .r = 0.0, .g = 1.0, .b = 0.0, .a = 1.0 },
                    .read_only = false,
                },
            },
        };

        const rpass = c.wgpu_command_encoder_begin_render_pass(cmd_encoder, &(c.WGPURenderPassDescriptor){
            .color_attachments = &color_attachments,
            .color_attachments_length = color_attachments.len,
            .depth_stencil_attachment = null,
        });

        c.wgpu_render_pass_set_pipeline(rpass, render_pipeline);
        c.wgpu_render_pass_set_bind_group(rpass, 0, bind_group, null, 0);
        c.wgpu_render_pass_draw(rpass, 3, 1, 0, 0);

        const queue = c.wgpu_device_get_default_queue(device);
        c.wgpu_render_pass_end_pass(rpass);
        const cmd_buf = c.wgpu_command_encoder_finish(cmd_encoder, null);
        c.wgpu_queue_submit(queue, &cmd_buf, 1);
        c.wgpu_swap_chain_present(swap_chain);

        c.glfwWaitEvents();
    }
}

const builtin = @import("builtin");
const std = @import("std");

const c = @import("c.zig");
const shaderc = @import("shaderc.zig");
const ft = @import("ft.zig");

pub const Renderer = struct {
    const Self = @This();

    tex: c.WGPUTextureId,
    tex_view: c.WGPUTextureViewId,
    tex_sampler: c.WGPUSamplerId,

    swap_chain: c.WGPUSwapChainId,

    device: c.WGPUDeviceId,
    surface: c.WGPUSurfaceId,

    queue: c.WGPUQueueId,

    bind_group: c.WGPUBindGroupId,
    bind_group_layout: c.WGPUBindGroupLayoutId,
    uniform_buffer: c.WGPUBufferId,
    char_grid_buffer: c.WGPUBufferId,

    render_pipeline: c.WGPURenderPipelineId,
    pipeline_layout: c.WGPUPipelineLayoutId,

    pub fn init(alloc: *std.mem.Allocator, window: *c.GLFWwindow, font: *const ft.Atlas) !Self {
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        // Extract the WGPU Surface from the platform-specific window
        const platform = builtin.os.tag;
        const surface = if (platform == builtin.Os.Tag.macos) surf: {
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

            break :surf c.wgpu_create_surface_from_metal_layer(metal_layer);
        } else {
            std.debug.panic("Unimplemented on platform {}", .{platform});
        };

        ////////////////////////////////////////////////////////////////////////////
        // WGPU initial setup
        var adapter: c.WGPUAdapterId = 0;
        c.wgpu_request_adapter_async(&(c.WGPURequestAdapterOptions){
            .power_preference = @intToEnum(c.WGPUPowerPreference, c.WGPUPowerPreference_HighPerformance),
            .compatible_surface = surface,
        }, 2 | 4 | 8, false, adapter_cb, &adapter);

        const device = c.wgpu_adapter_request_device(adapter, 0, &(c.WGPUCLimits){
            .max_bind_groups = 1,
        }, true, null);

        ////////////////////////////////////////////////////////////////////////////
        // Build the shaders using shaderc
        const vert_spv = shaderc.build_shader_from_file(tmp_alloc, "shaders/grid.vert") catch |err| {
            std.debug.panic("Could not open file", .{});
        };
        const vert_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
            .bytes = vert_spv.ptr,
            .length = vert_spv.len,
        });

        const frag_spv = shaderc.build_shader_from_file(tmp_alloc, "shaders/grid.frag") catch |err| {
            std.debug.panic("Could not open file", .{});
        };
        const frag_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
            .bytes = frag_spv.ptr,
            .length = frag_spv.len,
        });

        ////////////////////////////////////////////////////////////////////////////
        // Upload the font atlas texture
        const tex_size = (c.WGPUExtent3d){
            .width = @intCast(u32, font.tex_size),
            .height = @intCast(u32, font.tex_size),
            .depth = 1,
        };

        const tex = c.wgpu_device_create_texture(device, &(c.WGPUTextureDescriptor){
            .size = tex_size,
            .mip_level_count = 1,
            .sample_count = 1,
            .dimension = @intToEnum(c.WGPUTextureDimension, c.WGPUTextureDimension_D2),
            .format = @intToEnum(c.WGPUTextureFormat, c.WGPUTextureFormat_R8Unorm),
            // SAMPLED tells wgpu that we want to use this texture in shaders
            // COPY_DST means that we want to copy data to this texture
            .usage = c.WGPUTextureUsage_SAMPLED | c.WGPUTextureUsage_COPY_DST,
            .label = "font_atlas",
        });

        const tex_view = c.wgpu_texture_create_view(tex, &(c.WGPUTextureViewDescriptor){
            .label = "font_atlas_view",
            .dimension = @intToEnum(c.WGPUTextureViewDimension, c.WGPUTextureViewDimension_D2),
            .format = @intToEnum(c.WGPUTextureFormat, c.WGPUTextureFormat_R8Unorm),
            .aspect = @intToEnum(c.WGPUTextureAspect, c.WGPUTextureAspect_All),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .array_layer_count = 1,
        });

        const tex_sampler = c.wgpu_device_create_sampler(device, &(c.WGPUSamplerDescriptor){
            .next_in_chain = null,
            .label = "font_atlas_sampler",
            .address_mode_u = @intToEnum(c.WGPUAddressMode, c.WGPUAddressMode_ClampToEdge),
            .address_mode_v = @intToEnum(c.WGPUAddressMode, c.WGPUAddressMode_ClampToEdge),
            .address_mode_w = @intToEnum(c.WGPUAddressMode, c.WGPUAddressMode_ClampToEdge),
            .mag_filter = @intToEnum(c.WGPUFilterMode, c.WGPUFilterMode_Linear),
            .min_filter = @intToEnum(c.WGPUFilterMode, c.WGPUFilterMode_Nearest),
            .mipmap_filter = @intToEnum(c.WGPUFilterMode, c.WGPUFilterMode_Nearest),
            .lod_min_clamp = 0.0,
            .lod_max_clamp = std.math.f32_max,
            .compare = @intToEnum(c.WGPUCompareFunction, c.WGPUCompareFunction_Undefined),
        });

        ////////////////////////////////////////////////////////////////////////////
        // Uniform buffers
        const uniform_buffer = c.wgpu_device_create_buffer(device, &(c.WGPUBufferDescriptor){
            .label = "Uniforms",
            .size = @sizeOf(c.fpUniforms),
            .usage = c.WGPUBufferUsage_UNIFORM | c.WGPUBufferUsage_COPY_DST,
            .mapped_at_creation = false,
        });
        const char_grid_buffer = c.wgpu_device_create_buffer(device, &(c.WGPUBufferDescriptor){
            .label = "Character grid",
            .size = @sizeOf(u32) * 512 * 512,
            .usage = c.WGPUBufferUsage_STORAGE | c.WGPUBufferUsage_COPY_DST,
            .mapped_at_creation = false,
        });

        ////////////////////////////////////////////////////////////////////////////
        // Bind groups (?!)
        const bind_group_layout_entries = [_]c.WGPUBindGroupLayoutEntry{
            (c.WGPUBindGroupLayoutEntry){
                .binding = 0,
                .visibility = c.WGPUShaderStage_FRAGMENT,
                .ty = c.WGPUBindingType_SampledTexture,

                .multisampled = false,
                .view_dimension = @intToEnum(c.WGPUTextureViewDimension, c.WGPUTextureViewDimension_D2),
                .texture_component_type = @intToEnum(c.WGPUTextureComponentType, c.WGPUTextureComponentType_Uint),
                .storage_texture_format = @intToEnum(c.WGPUTextureFormat, c.WGPUTextureFormat_R8Unorm),

                .count = undefined,
                .has_dynamic_offset = undefined,
                .min_buffer_binding_size = undefined,
            },
            (c.WGPUBindGroupLayoutEntry){
                .binding = 1,
                .visibility = c.WGPUShaderStage_FRAGMENT,
                .ty = c.WGPUBindingType_Sampler,

                .multisampled = undefined,
                .view_dimension = undefined,
                .texture_component_type = undefined,
                .storage_texture_format = undefined,
                .count = undefined,
                .has_dynamic_offset = undefined,
                .min_buffer_binding_size = undefined,
            },
            (c.WGPUBindGroupLayoutEntry){
                .binding = 2,
                .visibility = c.WGPUShaderStage_VERTEX | c.WGPUShaderStage_FRAGMENT,
                .ty = c.WGPUBindingType_UniformBuffer,

                .has_dynamic_offset = false,
                .min_buffer_binding_size = 0,

                .multisampled = undefined,
                .view_dimension = undefined,
                .texture_component_type = undefined,
                .storage_texture_format = undefined,
                .count = undefined,
            },
            (c.WGPUBindGroupLayoutEntry){
                .binding = 3,
                .visibility = c.WGPUShaderStage_VERTEX,
                .ty = c.WGPUBindingType_StorageBuffer,

                .has_dynamic_offset = false,
                .min_buffer_binding_size = 0,

                .multisampled = undefined,
                .view_dimension = undefined,
                .texture_component_type = undefined,
                .storage_texture_format = undefined,
                .count = undefined,
            },
        };
        const bind_group_layout = c.wgpu_device_create_bind_group_layout(device, &(c.WGPUBindGroupLayoutDescriptor){
            .label = "bind group layout",
            .entries = &bind_group_layout_entries,
            .entries_length = bind_group_layout_entries.len,
        });
        const bind_group_entries = [_]c.WGPUBindGroupEntry{
            (c.WGPUBindGroupEntry){
                .binding = 0,
                .texture_view = tex_view,
                .sampler = 0, // None
                .buffer = 0, // None

                .offset = undefined,
                .size = undefined,
            },
            (c.WGPUBindGroupEntry){
                .binding = 1,
                .sampler = tex_sampler,
                .texture_view = 0, // None
                .buffer = 0, // None

                .offset = undefined,
                .size = undefined,
            },
            (c.WGPUBindGroupEntry){
                .binding = 2,
                .buffer = uniform_buffer,
                .offset = 0,
                .size = @sizeOf(c.fpUniforms),

                .sampler = 0, // None
                .texture_view = 0, // None
            },
            (c.WGPUBindGroupEntry){
                .binding = 3,
                .buffer = char_grid_buffer,
                .offset = 0,
                .size = @sizeOf(u32) * 512 * 512,

                .sampler = 0, // None
                .texture_view = 0, // None
            },
        };
        const bind_group = c.wgpu_device_create_bind_group(device, &(c.WGPUBindGroupDescriptor){
            .label = "bind group",
            .layout = bind_group_layout,
            .entries = &bind_group_entries,
            .entries_length = bind_group_entries.len,
        });
        const bind_group_layouts = [_]c.WGPUBindGroupId{bind_group_layout};

        ////////////////////////////////////////////////////////////////////////////
        // Render pipelines (?!?)
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

        var out = Renderer{
            .tex = tex,
            .tex_view = tex_view,
            .tex_sampler = tex_sampler,

            .swap_chain = undefined, // assigned in resize_swap_chain below

            .device = device,
            .surface = surface,

            .queue = c.wgpu_device_get_default_queue(device),

            .bind_group = bind_group,
            .bind_group_layout = bind_group_layout,
            .uniform_buffer = uniform_buffer,
            .char_grid_buffer = char_grid_buffer,

            .render_pipeline = render_pipeline,
            .pipeline_layout = pipeline_layout,
        };

        out.update_font_tex(font);
        return out;
    }

    pub fn update_font_tex(self: *Self, font: *const ft.Atlas) void {
        const tex_size = (c.WGPUExtent3d){
            .width = @intCast(u32, font.tex_size),
            .height = @intCast(u32, font.tex_size),
            .depth = 1,
        };
        c.wgpu_queue_write_texture(self.queue, &(c.WGPUTextureCopyView){
            .texture = self.tex,
            .mip_level = 0,
            .origin = (c.WGPUOrigin3d){ .x = 0, .y = 0, .z = 0 },
        }, font.tex.ptr, font.tex.len, &(c.WGPUTextureDataLayout){
            .offset = 0,
            .bytes_per_row = @intCast(u32, font.tex_size),
            .rows_per_image = @intCast(u32, font.tex_size),
        }, &tex_size);
    }

    pub fn redraw(self: *Self, total_tiles: u32) void {
        const next_texture = c.wgpu_swap_chain_get_next_texture(self.swap_chain);
        if (next_texture.view_id == 0) {
            std.debug.panic("Cannot acquire next swap chain texture", .{});
        }

        const cmd_encoder = c.wgpu_device_create_command_encoder(
            self.device,
            &(c.WGPUCommandEncoderDescriptor){ .label = "command encoder" },
        );

        const color_attachments = [_]c.WGPURenderPassColorAttachmentDescriptor{
            (c.WGPURenderPassColorAttachmentDescriptor){
                .attachment = next_texture.view_id,
                .resolve_target = 0,
                .channel = (c.WGPUPassChannel_Color){
                    .load_op = @intToEnum(c.WGPULoadOp, c.WGPULoadOp_Clear),
                    .store_op = @intToEnum(c.WGPUStoreOp, c.WGPUStoreOp_Store),
                    .clear_value = (c.WGPUColor){
                        .r = 0.0,
                        .g = 0.0,
                        .b = 0.0,
                        .a = 1.0,
                    },
                    .read_only = false,
                },
            },
        };

        const rpass = c.wgpu_command_encoder_begin_render_pass(
            cmd_encoder,
            &(c.WGPURenderPassDescriptor){
                .color_attachments = &color_attachments,
                .color_attachments_length = color_attachments.len,
                .depth_stencil_attachment = null,
            },
        );

        c.wgpu_render_pass_set_pipeline(rpass, self.render_pipeline);
        c.wgpu_render_pass_set_bind_group(rpass, 0, self.bind_group, null, 0);
        c.wgpu_render_pass_draw(rpass, total_tiles * 6, 1, 0, 0);

        c.wgpu_render_pass_end_pass(rpass);
        const cmd_buf = c.wgpu_command_encoder_finish(cmd_encoder, null);
        c.wgpu_queue_submit(self.queue, &cmd_buf, 1);
        c.wgpu_swap_chain_present(self.swap_chain);
    }

    pub fn deinit(self: *Self) void {
        c.wgpu_texture_destroy(self.tex);
        c.wgpu_texture_view_destroy(self.tex_view);
        c.wgpu_sampler_destroy(self.tex_sampler);

        c.wgpu_bind_group_destroy(self.bind_group);
        c.wgpu_bind_group_layout_destroy(self.bind_group_layout);
        c.wgpu_buffer_destroy(self.uniform_buffer);
        c.wgpu_buffer_destroy(self.char_grid_buffer);

        c.wgpu_pipeline_layout_destroy(self.pipeline_layout);

        c.glfwDestroyWindow(self.window);
    }

    pub fn update_grid(self: *Self, char_grid: []u32) void {
        c.wgpu_queue_write_buffer(
            self.queue,
            self.char_grid_buffer,
            0,
            @ptrCast([*c]const u8, char_grid.ptr),
            char_grid.len * @sizeOf(u32),
        );
    }

    pub fn resize_swap_chain(self: *Self, width: u32, height: u32) void {
        self.swap_chain = c.wgpu_device_create_swap_chain(
            self.device,
            self.surface,
            &(c.WGPUSwapChainDescriptor){
                .usage = c.WGPUTextureUsage_OUTPUT_ATTACHMENT,
                .format = @intToEnum(
                    c.WGPUTextureFormat,
                    c.WGPUTextureFormat_Bgra8Unorm,
                ),
                .width = width,
                .height = height,
                .present_mode = @intToEnum(
                    c.WGPUPresentMode,
                    c.WGPUPresentMode_Fifo,
                ),
            },
        );
    }

    pub fn update_uniforms(self: *Self, u: *const c.fpUniforms) void {
        c.wgpu_queue_write_buffer(
            self.queue,
            self.uniform_buffer,
            0,
            @ptrCast([*c]const u8, u),
            @sizeOf(c.fpUniforms),
        );
    }
};

export fn adapter_cb(received: c.WGPUAdapterId, data: ?*c_void) void {
    @ptrCast(*c.WGPUAdapterId, @alignCast(8, data)).* = received;
}

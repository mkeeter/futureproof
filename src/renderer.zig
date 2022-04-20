const builtin = @import("builtin");
const std = @import("std");

const c = @import("c.zig");
const shaderc = @import("shaderc.zig");
const ft = @import("ft.zig");

const Blit = @import("blit.zig").Blit;
const Preview = @import("preview.zig").Preview;
const Shader = @import("shaderc.zig").Shader;

pub const Renderer = struct {
    const Self = @This();

    tex: c.WGPUTextureId,
    tex_view: c.WGPUTextureViewId,
    tex_sampler: c.WGPUSamplerId,

    swap_chain: c.WGPUSwapChainId,
    width: u32,
    height: u32,

    device: c.WGPUDeviceId,
    surface: c.WGPUSurfaceId,

    queue: c.WGPUQueueId,

    bind_group: c.WGPUBindGroupId,
    uniform_buffer: c.WGPUBufferId,
    char_grid_buffer: c.WGPUBufferId,

    render_pipeline: c.WGPURenderPipelineId,

    preview: ?*Preview,
    blit: Blit,

    // We track the last few preview times; if the media is under 30 FPS,
    // then we switch to tiled rendering
    dt: [5]i64,
    dt_index: usize,

    pub fn init(alloc: std.mem.Allocator, window: *c.GLFWwindow, font: *const ft.Atlas) !Self {
        var arena = std.heap.ArenaAllocator.init(alloc);
        defer arena.deinit();
        var tmp_alloc = arena.allocator();

        // Extract the WGPU Surface from the platform-specific window
        const platform = builtin.os.tag;
        const surface = if (platform == .macos) surf: {
            // Time to do hilarious Objective-C runtime hacks, equivalent to
            //  [ns_window.contentView setWantsLayer:YES];
            //  id metal_layer = [CAMetalLayer layer];
            //  [ns_window.contentView setLayer:metal_layer];
            const objc = @import("objc.zig");
            const darwin = @import("darwin.zig");

            const cocoa_window = darwin.glfwGetCocoaWindow(window);
            const ns_window = @ptrCast(c.id, @alignCast(8, cocoa_window));

            const cv = objc.call(ns_window, "contentView");
            _ = objc.call_(cv, "setWantsLayer:", true);

            const ca_metal = objc.class("CAMetalLayer");
            const metal_layer = objc.call(ca_metal, "layer");

            _ = objc.call_(cv, "setLayer:", metal_layer);

            break :surf c.wgpu_create_surface_from_metal_layer(metal_layer);
        } else {
            std.debug.panic("Unimplemented on platform {}", .{platform});
        };

        ////////////////////////////////////////////////////////////////////////////
        // WGPU initial setup
        var adapter: c.WGPUAdapterId = 0;
        c.wgpu_request_adapter_async(&(c.WGPURequestAdapterOptions){
            .power_preference = c.WGPUPowerPreference_HighPerformance,
            .compatible_surface = surface,
        }, 2 | 4 | 8, false, adapter_cb, &adapter);

        const device = c.wgpu_adapter_request_device(
            adapter,
            0,
            &(c.WGPUCLimits){
                .max_bind_groups = 1,
            },
            true,
            null,
        );

        ////////////////////////////////////////////////////////////////////////////
        // Build the shaders using shaderc
        const vert_spv = try shaderc.build_shader_from_file(&tmp_alloc, "shaders/grid.vert");
        const vert_shader = c.wgpu_device_create_shader_module(
            device,
            (c.WGPUShaderSource){
                .bytes = vert_spv.ptr,
                .length = vert_spv.len,
            },
        );
        defer c.wgpu_shader_module_destroy(vert_shader);

        const frag_spv = try shaderc.build_shader_from_file(&tmp_alloc, "shaders/grid.frag");
        const frag_shader = c.wgpu_device_create_shader_module(
            device,
            (c.WGPUShaderSource){
                .bytes = frag_spv.ptr,
                .length = frag_spv.len,
            },
        );
        defer c.wgpu_shader_module_destroy(frag_shader);

        ////////////////////////////////////////////////////////////////////////////
        // Upload the font atlas texture
        const tex_size = (c.WGPUExtent3d){
            .width = @intCast(u32, font.tex_size),
            .height = @intCast(u32, font.tex_size),
            .depth = 1,
        };

        const tex = c.wgpu_device_create_texture(
            device,
            &(c.WGPUTextureDescriptor){
                .size = tex_size,
                .mip_level_count = 1,
                .sample_count = 1,
                //.dimension = c.WGPUTextureDimension_D2,
                .dimension = c.WGPUTextureDimension_D2,
                .format = c.WGPUTextureFormat_Rgba8Unorm,
                // SAMPLED tells wgpu that we want to use this texture in shaders
                // COPY_DST means that we want to copy data to this texture
                .usage = c.WGPUTextureUsage_SAMPLED | c.WGPUTextureUsage_COPY_DST,
                .label = "font_atlas",
            },
        );

        const tex_view = c.wgpu_texture_create_view(
            tex,
            &(c.WGPUTextureViewDescriptor){
                .label = "font_atlas_view",
                .dimension = c.WGPUTextureViewDimension_D2,
                .format = c.WGPUTextureFormat_Rgba8Unorm,
                .aspect = c.WGPUTextureAspect_All,
                .base_mip_level = 0,
                .level_count = 1,
                .base_array_layer = 0,
                .array_layer_count = 1,
            },
        );

        const tex_sampler = c.wgpu_device_create_sampler(
            device,
            &(c.WGPUSamplerDescriptor){
                .next_in_chain = null,
                .label = "font_atlas_sampler",
                .address_mode_u = c.WGPUAddressMode_ClampToEdge,
                .address_mode_v = c.WGPUAddressMode_ClampToEdge,
                .address_mode_w = c.WGPUAddressMode_ClampToEdge,
                .mag_filter = c.WGPUFilterMode_Linear,
                .min_filter = c.WGPUFilterMode_Nearest,
                .mipmap_filter = c.WGPUFilterMode_Nearest,
                .lod_min_clamp = 0.0,
                .lod_max_clamp = std.math.f32_max,
                .compare = c.WGPUCompareFunction_Undefined,
            },
        );

        ////////////////////////////////////////////////////////////////////////////
        // Uniform buffers
        const uniform_buffer = c.wgpu_device_create_buffer(
            device,
            &(c.WGPUBufferDescriptor){
                .label = "Uniforms",
                .size = @sizeOf(c.fpUniforms),
                .usage = c.WGPUBufferUsage_UNIFORM | c.WGPUBufferUsage_COPY_DST,
                .mapped_at_creation = false,
            },
        );
        const char_grid_buffer = c.wgpu_device_create_buffer(
            device,
            &(c.WGPUBufferDescriptor){
                .label = "Character grid",
                .size = @sizeOf(u32) * 512 * 512,
                .usage = c.WGPUBufferUsage_STORAGE | c.WGPUBufferUsage_COPY_DST,
                .mapped_at_creation = false,
            },
        );

        ////////////////////////////////////////////////////////////////////////////
        // Bind groups (?!)
        const bind_group_layout_entries = [_]c.WGPUBindGroupLayoutEntry{
            (c.WGPUBindGroupLayoutEntry){
                .binding = 0,
                .visibility = c.WGPUShaderStage_FRAGMENT,
                .ty = c.WGPUBindingType_SampledTexture,
                .multisampled = false,
                .view_dimension = c.WGPUTextureViewDimension_D2,
                .texture_component_type = c.WGPUTextureComponentType_Uint,
                .storage_texture_format = c.WGPUTextureFormat_Rgba8Unorm,
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
        const bind_group_layout = c.wgpu_device_create_bind_group_layout(
            device,
            &(c.WGPUBindGroupLayoutDescriptor){
                .label = "bind group layout",
                .entries = &bind_group_layout_entries,
                .entries_length = bind_group_layout_entries.len,
            },
        );
        defer c.wgpu_bind_group_layout_destroy(bind_group_layout);

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
        const bind_group = c.wgpu_device_create_bind_group(
            device,
            &(c.WGPUBindGroupDescriptor){
                .label = "bind group",
                .layout = bind_group_layout,
                .entries = &bind_group_entries,
                .entries_length = bind_group_entries.len,
            },
        );
        const bind_group_layouts = [_]c.WGPUBindGroupId{bind_group_layout};

        ////////////////////////////////////////////////////////////////////////////
        // Render pipelines (?!?)
        const pipeline_layout = c.wgpu_device_create_pipeline_layout(
            device,
            &(c.WGPUPipelineLayoutDescriptor){
                .bind_group_layouts = &bind_group_layouts,
                .bind_group_layouts_length = bind_group_layouts.len,
            },
        );
        defer c.wgpu_pipeline_layout_destroy(pipeline_layout);

        const render_pipeline = c.wgpu_device_create_render_pipeline(
            device,
            &(c.WGPURenderPipelineDescriptor){
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
                    .front_face = c.WGPUFrontFace_Ccw,
                    .cull_mode = c.WGPUCullMode_None,
                    .depth_bias = 0,
                    .depth_bias_slope_scale = 0.0,
                    .depth_bias_clamp = 0.0,
                },
                .primitive_topology = c.WGPUPrimitiveTopology_TriangleList,
                .color_states = &(c.WGPUColorStateDescriptor){
                    .format = c.WGPUTextureFormat_Bgra8Unorm,
                    .alpha_blend = (c.WGPUBlendDescriptor){
                        .src_factor = c.WGPUBlendFactor_One,
                        .dst_factor = c.WGPUBlendFactor_Zero,
                        .operation = c.WGPUBlendOperation_Add,
                    },
                    .color_blend = (c.WGPUBlendDescriptor){
                        .src_factor = c.WGPUBlendFactor_One,
                        .dst_factor = c.WGPUBlendFactor_Zero,
                        .operation = c.WGPUBlendOperation_Add,
                    },
                    .write_mask = c.WGPUColorWrite_ALL,
                },
                .color_states_length = 1,
                .depth_stencil_state = null,
                .vertex_state = (c.WGPUVertexStateDescriptor){
                    .index_format = c.WGPUIndexFormat_Uint16,
                    .vertex_buffers = null,
                    .vertex_buffers_length = 0,
                },
                .sample_count = 1,
                .sample_mask = 0,
                .alpha_to_coverage_enabled = false,
            },
        );

        var out = Renderer{
            .tex = tex,
            .tex_view = tex_view,
            .tex_sampler = tex_sampler,

            .swap_chain = undefined, // assigned in resize_swap_chain below
            .width = undefined,
            .height = undefined,

            .device = device,
            .surface = surface,

            .queue = c.wgpu_device_get_default_queue(device),

            .bind_group = bind_group,
            .uniform_buffer = uniform_buffer,
            .char_grid_buffer = char_grid_buffer,

            .render_pipeline = render_pipeline,

            .preview = null,
            .blit = try Blit.init(alloc, device),

            .dt = undefined,
            .dt_index = 0,
        };

        out.reset_dt();
        out.update_font_tex(font);
        return out;
    }

    pub fn clear_preview(self: *Self, alloc: std.mem.Allocator) void {
        if (self.preview) |p| {
            p.deinit();
            alloc.destroy(p);
            self.preview = null;
        }
    }

    fn reset_dt(self: *Self) void {
        var i: usize = 0;
        while (i < self.dt.len) : (i += 1) {
            self.dt[i] = 0;
        }
        self.dt_index = 0;
    }

    pub fn update_preview(self: *Self, alloc: std.mem.Allocator, s: Shader) !void {
        self.clear_preview(alloc);

        // Construct a new Preview with our current state
        var p = try alloc.create(Preview);
        p.* = try Preview.init(alloc, self.device, s.spirv, s.has_time);
        p.set_size(self.width, self.height);

        self.preview = p;
        self.blit.bind_to_tex(p.tex_view[1]);
        self.reset_dt();
    }

    pub fn update_font_tex(self: *Self, font: *const ft.Atlas) void {
        const tex_size = (c.WGPUExtent3d){
            .width = @intCast(u32, font.tex_size),
            .height = @intCast(u32, font.tex_size),
            .depth = 1,
        };
        c.wgpu_queue_write_texture(
            self.queue,
            &(c.WGPUTextureCopyView){
                .texture = self.tex,
                .mip_level = 0,
                .origin = (c.WGPUOrigin3d){ .x = 0, .y = 0, .z = 0 },
            },
            @ptrCast([*]const u8, font.tex.ptr),
            font.tex.len * @sizeOf(u32),
            &(c.WGPUTextureDataLayout){
                .offset = 0,
                .bytes_per_row = @intCast(u32, font.tex_size) * @sizeOf(u32),
                .rows_per_image = @intCast(u32, font.tex_size) * @sizeOf(u32),
            },
            &tex_size,
        );
    }

    pub fn redraw(self: *Self, total_tiles: u32) void {
        const start_ms = std.time.milliTimestamp();

        // Render the preview to its internal texture, then blit from that
        // texture to the main swap chain.  This lets us render the preview
        // at a different resolution from the rest of the UI.
        if (self.preview) |p| {
            p.redraw();
            if ((p.uniforms._tiles_per_side > 1 and p.uniforms._tile_num != 0) or
                p.draw_continuously)
            {
                c.glfwPostEmptyEvent();
            }
        }

        // Begin the main render operation
        const next_texture = c.wgpu_swap_chain_get_next_texture(self.swap_chain);
        if (next_texture.view_id == 0) {
            std.debug.panic("Cannot acquire next swap chain texture", .{});
        }

        const cmd_encoder = c.wgpu_device_create_command_encoder(
            self.device,
            &(c.WGPUCommandEncoderDescriptor){ .label = "main encoder" },
        );

        const color_attachments = [_]c.WGPURenderPassColorAttachmentDescriptor{
            (c.WGPURenderPassColorAttachmentDescriptor){
                .attachment = next_texture.view_id,
                .resolve_target = 0,
                .channel = (c.WGPUPassChannel_Color){
                    .load_op = c.WGPULoadOp_Clear,
                    .store_op = c.WGPUStoreOp_Store,
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
        if (self.preview != null) {
            self.blit.redraw(next_texture, cmd_encoder);
        }

        const cmd_buf = c.wgpu_command_encoder_finish(cmd_encoder, null);
        c.wgpu_queue_submit(self.queue, &cmd_buf, 1);

        c.wgpu_swap_chain_present(self.swap_chain);

        const end_ms = std.time.milliTimestamp();
        self.dt[self.dt_index] = end_ms - start_ms;
        self.dt_index = (self.dt_index + 1) % self.dt.len;

        var dt_local = self.dt;
        const asc = comptime std.sort.asc(i64);
        std.sort.sort(i64, dt_local[0..], {}, asc);
        const dt = dt_local[self.dt.len / 2];

        if (dt > 33) {
            if (self.preview) |p| {
                p.adjust_tiles(dt);
                self.reset_dt();
            }
        }
    }

    pub fn deinit(self: *Self, alloc: std.mem.Allocator) void {
        c.wgpu_texture_destroy(self.tex);
        c.wgpu_texture_view_destroy(self.tex_view);
        c.wgpu_sampler_destroy(self.tex_sampler);

        c.wgpu_bind_group_destroy(self.bind_group);
        c.wgpu_buffer_destroy(self.uniform_buffer);
        c.wgpu_buffer_destroy(self.char_grid_buffer);

        c.wgpu_render_pipeline_destroy(self.render_pipeline);

        if (self.preview) |p| {
            p.deinit();
            alloc.destroy(p);
        }
        self.blit.deinit();
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
                .format = c.WGPUTextureFormat_Bgra8Unorm,
                .width = width,
                .height = height,
                .present_mode = c.WGPUPresentMode_Fifo,
            },
        );

        // Track width and height so that we can set them in a Preview
        // (even if one isn't loaded right now)
        self.width = width;
        self.height = height;
        if (self.preview) |p| {
            p.set_size(width, height);
            self.blit.bind_to_tex(p.tex_view[1]);
        }
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

export fn adapter_cb(received: c.WGPUAdapterId, data: ?*anyopaque) void {
    @ptrCast(*c.WGPUAdapterId, @alignCast(8, data)).* = received;
}

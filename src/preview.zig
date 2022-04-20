const std = @import("std");

const c = @import("c.zig");
const shaderc = @import("shaderc.zig");

pub const Preview = struct {
    const Self = @This();

    device: c.WGPUDeviceId,
    queue: c.WGPUQueueId,

    // We render into tex[0] in tiles to keep up a good framerate, then
    // copy to tex[1] to render the complete image without tearing
    tex: [2]c.WGPUTextureId,
    tex_view: [2]c.WGPUTextureViewId,
    tex_size: c.WGPUExtent3d,

    bind_group: c.WGPUBindGroupId,
    uniform_buffer: c.WGPUBufferId,
    render_pipeline: c.WGPURenderPipelineId,

    start_time: i64,
    uniforms: c.fpPreviewUniforms,
    draw_continuously: bool,

    pub fn init(
        alloc: std.mem.Allocator,
        device: c.WGPUDeviceId,
        frag: []const u32,
        draw_continuously: bool,
    ) !Preview {
        var arena = std.heap.ArenaAllocator.init(alloc);
        defer arena.deinit();

        var tmp_alloc = arena.allocator();

        // Build the shaders using shaderc
        const vert_spv = shaderc.build_shader_from_file(&tmp_alloc, "shaders/preview.vert") catch |err| {
            std.debug.panic("Could not build preview.vert: {}", .{err});
        };
        const vert_shader = c.wgpu_device_create_shader_module(
            device,
            (c.WGPUShaderSource){
                .bytes = vert_spv.ptr,
                .length = vert_spv.len,
            },
        );
        defer c.wgpu_shader_module_destroy(vert_shader);
        const frag_shader = c.wgpu_device_create_shader_module(
            device,
            (c.WGPUShaderSource){
                .bytes = frag.ptr,
                .length = frag.len,
            },
        );
        defer c.wgpu_shader_module_destroy(frag_shader);

        ////////////////////////////////////////////////////////////////////////////////
        // Uniform buffers
        const uniform_buffer = c.wgpu_device_create_buffer(
            device,
            &(c.WGPUBufferDescriptor){
                .label = "Uniforms",
                .size = @sizeOf(c.fpPreviewUniforms),
                .usage = c.WGPUBufferUsage_UNIFORM | c.WGPUBufferUsage_COPY_DST,
                .mapped_at_creation = false,
            },
        );

        ////////////////////////////////////////////////////////////////////////////////
        const bind_group_layout_entries = [_]c.WGPUBindGroupLayoutEntry{
            (c.WGPUBindGroupLayoutEntry){
                .binding = 0,
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
                .buffer = uniform_buffer,
                .offset = 0,
                .size = @sizeOf(c.fpPreviewUniforms),
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

        const start_time = std.time.milliTimestamp();
        return Self{
            .device = device,
            .queue = c.wgpu_device_get_default_queue(device),

            .render_pipeline = render_pipeline,
            .uniform_buffer = uniform_buffer,
            .bind_group = bind_group,

            .start_time = start_time,
            .draw_continuously = draw_continuously,

            // Assigned in set_size below
            .tex = undefined,
            .tex_view = undefined,
            .tex_size = undefined,

            .uniforms = .{
                .iResolution = .{ .x = 0, .y = 0, .z = 0 },
                .iTime = 0.0,
                .iMouse = .{ .x = 0, .y = 0, .z = 0, .w = 0 },
                ._tiles_per_side = 1,
                ._tile_num = 0,
            },
        };
    }

    fn destroy_textures(self: *const Self) void {
        // If the texture was created, then destroy it
        if (self.uniforms.iResolution.x != 0) {
            for (self.tex) |t| {
                c.wgpu_texture_destroy(t);
            }
            for (self.tex_view) |t| {
                c.wgpu_texture_view_destroy(t);
            }
        }
    }

    pub fn adjust_tiles(self: *Self, dt: i64) void {
        // What's the total render time, approximately?
        const dt_est = std.math.pow(i64, self.uniforms._tiles_per_side, 2) * dt;

        // We'd like to keep the UI running at 60 FPS, approximately
        const t = std.math.ceil(std.math.sqrt(@intToFloat(f32, @divFloor(dt_est, 16))));

        std.debug.print(
            "Switching from {} to {} tiles per side\n",
            .{ self.uniforms._tiles_per_side, t },
        );
        var t_ = @floatToInt(u32, t);
        if (t_ > 5) {
            t_ = 5;
        }
        self.uniforms._tiles_per_side = t_;
        self.uniforms._tile_num = 0;
    }

    pub fn deinit(self: *const Self) void {
        c.wgpu_bind_group_destroy(self.bind_group);
        c.wgpu_buffer_destroy(self.uniform_buffer);
        c.wgpu_render_pipeline_destroy(self.render_pipeline);
        self.destroy_textures();
    }

    pub fn set_size(self: *Self, width: u32, height: u32) void {
        self.destroy_textures();

        self.tex_size = (c.WGPUExtent3d){
            .width = @intCast(u32, width / 2),
            .height = @intCast(u32, height),
            .depth = 1,
        };

        var i: u8 = 0;
        while (i < 2) : (i += 1) {
            self.tex[i] = c.wgpu_device_create_texture(
                self.device,
                &(c.WGPUTextureDescriptor){
                    .size = self.tex_size,
                    .mip_level_count = 1,
                    .sample_count = 1,
                    .dimension = c.WGPUTextureDimension_D2,
                    .format = c.WGPUTextureFormat_Bgra8Unorm,

                    // We render to this texture, then use it as a source when
                    // blitting into the final UI image
                    .usage = if (i == 0)
                        (c.WGPUTextureUsage_OUTPUT_ATTACHMENT |
                            c.WGPUTextureUsage_COPY_SRC)
                    else
                        (c.WGPUTextureUsage_OUTPUT_ATTACHMENT |
                            c.WGPUTextureUsage_COPY_SRC |
                            c.WGPUTextureUsage_SAMPLED |
                            c.WGPUTextureUsage_COPY_DST),
                    .label = "preview_tex",
                },
            );

            self.tex_view[i] = c.wgpu_texture_create_view(
                self.tex[i],
                &(c.WGPUTextureViewDescriptor){
                    .label = "preview_tex_view",
                    .dimension = c.WGPUTextureViewDimension_D2,
                    .format = c.WGPUTextureFormat_Bgra8Unorm,
                    .aspect = c.WGPUTextureAspect_All,
                    .base_mip_level = 0,
                    .level_count = 1,
                    .base_array_layer = 0,
                    .array_layer_count = 1,
                },
            );
        }

        self.uniforms.iResolution.x = @intToFloat(f32, width) / 2;
        self.uniforms.iResolution.y = @intToFloat(f32, height);
    }

    pub fn redraw(self: *Self) void {
        const cmd_encoder = c.wgpu_device_create_command_encoder(
            self.device,
            &(c.WGPUCommandEncoderDescriptor){ .label = "preview encoder" },
        );

        // Set the time in the uniforms array
        if (self.uniforms._tile_num == 0) {
            const time_ms = std.time.milliTimestamp() - self.start_time;
            self.uniforms.iTime = @intToFloat(f32, time_ms) / 1000.0;
        }

        c.wgpu_queue_write_buffer(
            self.queue,
            self.uniform_buffer,
            0,
            @ptrCast([*c]const u8, &self.uniforms),
            @sizeOf(c.fpPreviewUniforms),
        );

        const load_op: c.WGPULoadOp = if (self.uniforms._tile_num == 0)
            c.WGPULoadOp_Clear
        else
            c.WGPULoadOp_Load;
        const color_attachments = [_]c.WGPURenderPassColorAttachmentDescriptor{
            (c.WGPURenderPassColorAttachmentDescriptor){
                .attachment = if (self.uniforms._tiles_per_side == 1) self.tex_view[1] else self.tex_view[0],
                .resolve_target = 0,
                .channel = (c.WGPUPassChannel_Color){
                    .load_op = load_op,
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
        c.wgpu_render_pass_draw(rpass, 6, 1, 0, 0);
        c.wgpu_render_pass_end_pass(rpass);

        // Move on to the next tile
        if (self.uniforms._tiles_per_side > 1) {
            self.uniforms._tile_num += 1;
        }

        // If we just finished rendering every tile, then also copy
        // to the deployment tex
        if (self.uniforms._tile_num == std.math.pow(u32, self.uniforms._tiles_per_side, 2)) {
            const src = (c.WGPUTextureCopyView){
                .texture = self.tex[0],
                .mip_level = 0,
                .origin = (c.WGPUOrigin3d){ .x = 0, .y = 0, .z = 0 },
            };
            const dst = (c.WGPUTextureCopyView){
                .texture = self.tex[1],
                .mip_level = 0,
                .origin = (c.WGPUOrigin3d){ .x = 0, .y = 0, .z = 0 },
            };
            c.wgpu_command_encoder_copy_texture_to_texture(
                cmd_encoder,
                &src,
                &dst,
                &self.tex_size,
            );
            self.uniforms._tile_num = 0;
        }

        const cmd_buf = c.wgpu_command_encoder_finish(cmd_encoder, null);
        c.wgpu_queue_submit(self.queue, &cmd_buf, 1);
    }
};

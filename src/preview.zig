const std = @import("std");

const c = @import("c.zig");
const shaderc = @import("shaderc.zig");

pub const Preview = struct {
    const Self = @This();

    queue: c.WGPUQueueId, // Used to update uniform buffer

    bind_group: c.WGPUBindGroupId,
    uniform_buffer: c.WGPUBufferId,
    render_pipeline: c.WGPURenderPipelineId,

    start_time: i64,

    pub fn init(
        alloc: *std.mem.Allocator,
        device: c.WGPUDeviceId,
        frag: []const u32,
    ) !Preview {
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        // Build the shaders using shaderc
        const vert_spv = shaderc.build_shader_from_file(tmp_alloc, "shaders/preview.vert") catch |err| {
            std.debug.panic("Could not open file", .{});
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
                .visibility = c.WGPUShaderStage_FRAGMENT,
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
                    .front_face = c.WGPUFrontFace._Ccw,
                    .cull_mode = c.WGPUCullMode._None,
                    .depth_bias = 0,
                    .depth_bias_slope_scale = 0.0,
                    .depth_bias_clamp = 0.0,
                },
                .primitive_topology = c.WGPUPrimitiveTopology._TriangleList,
                .color_states = &(c.WGPUColorStateDescriptor){
                    .format = c.WGPUTextureFormat._Bgra8Unorm,
                    .alpha_blend = (c.WGPUBlendDescriptor){
                        .src_factor = c.WGPUBlendFactor._One,
                        .dst_factor = c.WGPUBlendFactor._Zero,
                        .operation = c.WGPUBlendOperation._Add,
                    },
                    .color_blend = (c.WGPUBlendDescriptor){
                        .src_factor = c.WGPUBlendFactor._One,
                        .dst_factor = c.WGPUBlendFactor._Zero,
                        .operation = c.WGPUBlendOperation._Add,
                    },
                    .write_mask = c.WGPUColorWrite_ALL,
                },
                .color_states_length = 1,
                .depth_stencil_state = null,
                .vertex_state = (c.WGPUVertexStateDescriptor){
                    .index_format = c.WGPUIndexFormat._Uint16,
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
            .queue = c.wgpu_device_get_default_queue(device),

            .render_pipeline = render_pipeline,
            .uniform_buffer = uniform_buffer,
            .bind_group = bind_group,

            .start_time = start_time,
        };
    }

    pub fn deinit(self: *const Self) void {
        c.wgpu_bind_group_destroy(self.bind_group);
        c.wgpu_buffer_destroy(self.uniform_buffer);
        c.wgpu_render_pipeline_destroy(self.render_pipeline);
    }

    pub fn redraw(
        self: *const Self,
        next_texture: c.WGPUSwapChainOutput,
        cmd_encoder: c.WGPUCommandEncoderId,
    ) void {
        const time_ms = std.time.milliTimestamp() - self.start_time;
        const abs_time = @intToFloat(f32, time_ms) / 1000.0;

        const uniforms = c.fpPreviewUniforms{
            .iResolution = c.vec3{ .x = 0, .y = 0, .z = 0 },
            .iTime = abs_time,
            .iMouse = c.vec4{ .x = 0, .y = 0, .z = 0, .w = 0 },
        };
        c.wgpu_queue_write_buffer(
            self.queue,
            self.uniform_buffer,
            0,
            @ptrCast([*c]const u8, &uniforms),
            @sizeOf(c.fpPreviewUniforms),
        );

        const color_attachments = [_]c.WGPURenderPassColorAttachmentDescriptor{
            (c.WGPURenderPassColorAttachmentDescriptor){
                .attachment = next_texture.view_id,
                .resolve_target = 0,
                .channel = (c.WGPUPassChannel_Color){
                    .load_op = c.WGPULoadOp._Load,
                    .store_op = c.WGPUStoreOp._Store,
                    .clear_value = undefined,
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
        c.wgpu_render_pass_draw(rpass, 3, 1, 0, 0);
        c.wgpu_render_pass_end_pass(rpass);
    }
};

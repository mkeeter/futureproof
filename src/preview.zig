const std = @import("std");

const c = @import("c.zig");
const shaderc = @import("shaderc.zig");

pub const Preview = struct {
    const Self = @This();

    pub fn init(alloc: *std.mem.Allocator, device: c.WGPUDeviceId) !*Preview {
        var arena = std.heap.ArenaAllocator.init(alloc);
        const tmp_alloc: *std.mem.Allocator = &arena.allocator;
        defer arena.deinit();

        // Build the shaders using shaderc
        const vert_spv = shaderc.build_shader_from_file(tmp_alloc, "shaders/preview.vert") catch |err| {
            std.debug.panic("Could not open file", .{});
        };
        const vert_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
            .bytes = vert_spv.ptr,
            .length = vert_spv.len,
        });
        const frag_spv = shaderc.build_shader_from_file(tmp_alloc, "shaders/preview.frag") catch |err| {
            std.debug.panic("Could not open file", .{});
        };
        const frag_shader = c.wgpu_device_create_shader_module(device, (c.WGPUShaderSource){
            .bytes = frag_spv.ptr,
            .length = frag_spv.len,
        });

        ////////////////////////////////////////////////////////////////////////////////
        const bind_group_layout = c.wgpu_device_create_bind_group_layout(
            device,
            &(c.WGPUBindGroupLayoutDescriptor){
                .label = "bind group layout",
                .entries = null,
                .entries_length = 0,
            },
        );
        const bind_group = c.wgpu_device_create_bind_group(
            device,
            &(c.WGPUBindGroupDescriptor){
                .label = "bind group",
                .layout = bind_group_layout,
                .entries = null,
                .entries_length = 0,
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
                        .src_factor = @intToEnum(c.WGPUBlendFactor.WGPUBlendFactor_One),
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
            },
        );

        var out = try alloc.create(Self);
        out.* = Self{};
        return out;
    }
};

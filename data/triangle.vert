#version 450
#pragma shader_stage(vertex)

out gl_PerVertex {
    vec4 gl_Position;
};

layout(location=0) out vec2 v_tex_coords;

// Hard-coded triangle layout
const vec2 positions[6] = vec2[6](
    vec2(0.0, 0.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(1.0, 1.0)
);

void main() {
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    v_tex_coords = positions[gl_VertexIndex];
}

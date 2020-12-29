// A Very Bad Cornell Box Raytracer
//
// Matt Keeter, 2020
// matt.j.keeter@gmail.com
//
// MIT / Apache Version 2
#define ID_BACK 1
#define ID_TOP 2
#define ID_LEFT 3
#define ID_RIGHT 4
#define ID_BOTTOM 5
#define ID_LIGHT 6
#define ID_SPHERE 7
#define ID_FRONT 8

////////////////////////////////////////////////////////////////////////////////
// RNGs
// http://byteblacksmith.com/improvements-to-the-canonical-one-liner-glsl-rand-for-opengl-es-2-0/
float rand(vec2 co) {
    float a = 12.9898;
    float b = 78.233;
    float c = 43758.5453;
    float dt = dot(co.xy, vec2(a, b));
    float sn = mod(dt, 3.1415926);
    return fract(sin(sn) * c);
}

vec3 rand3(vec3 seed) {
    float x = rand(vec2(seed.z, rand(seed.xy)));
    float y = rand(vec2(seed.y, rand(seed.xz)));
    float z = rand(vec2(seed.x, rand(seed.yz)));
    return 2.0 * (vec3(x, y, z) - 0.5);
}

vec3 rand3_sphere(vec3 seed) {
    while (true) {
        vec3 v = rand3(seed);
        if (length(v) <= 1.0) {
            return normalize(v);
        }
        seed += vec3(0.1, 1, 10);
    }
}

////////////////////////////////////////////////////////////////////////////////
// SHAPES
#define SPHERE_CENTER vec3(-0.4, -0.5, -0.5)

vec4 plane(vec3 norm, float off, vec3 start, vec3 dir) {
    // dot(norm, pos) == off
    // dot(norm, start + n*dir) == off
    // dot(norm, start) + dot(norm, n*dir) == off
    // dot(norm, start) + n*dot(norm, dir) == off
    float d = (off - dot(norm, start)) / dot(norm, dir);
    if (d > 0) {
        return vec4(start + d*dir, 1);
    } else {
        return vec4(0);
    }
}

vec4 rear(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(0, 0, 1), -1, start, dir);
    return (p.w != 0 && abs(p.x) < 1 && abs(p.y) < 1)
        ? vec4(p.xyz, ID_BACK)
        : vec4(0);
}
vec4 front(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(0, 0, -1), -1, start, dir);
    return (p.w != 0 && abs(p.x) < 1 && abs(p.y) < 1)
        ? vec4(p.xyz, ID_FRONT)
        : vec4(0);
}

vec4 top(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(0, 1, 0), 1, start, dir);
    return (p.w != 0 && abs(p.x) < 1 && abs(p.z) < 1)
        ? vec4(p.xyz, ID_TOP)
        : vec4(0);
}

vec4 light(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(0, 1, 0), 1, start, dir);
    return (p.w != 0 && abs(p.x) < 0.3 && abs(p.z) < 0.3)
        ? vec4(p.xyz, ID_LIGHT)
        : vec4(0);
}

vec4 bottom(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(0, -1, 0), 1, start, dir);
    return (p.w != 0 && abs(p.x) < 1 && abs(p.z) < 1)
        ? vec4(p.xyz, ID_BOTTOM)
        : vec4(0);
}

vec4 left(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(1, 0, 0), -1, start, dir);
    return (p.w != 0 && abs(p.y) < 1 && abs(p.z) < 1)
        ? vec4(p.xyz, ID_LEFT)
        : vec4(0);
}

vec4 right(vec3 start, vec3 dir) {
    vec4 p = plane(vec3(-1, 0, 0), -1, start, dir);
    return (p.w != 0 && abs(p.y) < 1 && abs(p.z) < 1)
        ? vec4(p.xyz, ID_RIGHT)
        : vec4(0);
}

vec4 sphere(vec3 start, vec3 dir) {
    vec3 center = SPHERE_CENTER;
    float r = 0.5;
    vec3 delta = center - start;
    float d = dot(delta, dir);
    vec3 nearest = start + dir * d;
    float min_distance = length(center - nearest);
    if (min_distance < r) {
        float q = sqrt(min_distance*min_distance + r*r);
        return vec4(nearest - q*dir, ID_SPHERE);
    } else {
        return vec4(0);
    }
}

vec3 norm(vec4 pos) {
    switch (int(pos.w)) {
        case ID_TOP: return vec3(0, -1, 0);
        case ID_BACK: return vec3(0, 0, 1);
        case ID_LEFT: return vec3(1, 0, 0);
        case ID_RIGHT: return vec3(-1, 0, 0);
        case ID_LIGHT: return vec3(0, -1, 0);
        case ID_BOTTOM: return vec3(0, 1, 0);
        case ID_SPHERE: return normalize(pos.xyz - SPHERE_CENTER);
        case ID_FRONT: return vec3(0, 0, -1);
        default: return vec3(0);
    }
}

// Returns the two coordinates which matter, for use in randomization
vec2 compress(vec4 pos) {
    switch (int(pos.w)) {
        case ID_TOP:    // fallthrough
        case ID_LIGHT:  // fallthrough
        case ID_BOTTOM: return pos.xz;

        case ID_FRONT:
        case ID_BACK: return pos.xy;

        case ID_LEFT: // fallthrough
        case ID_RIGHT: return pos.yz;
        case ID_SPHERE: return pos.yz;

        default: return vec2(0);
    }
}

vec3 rand3_norm(vec4 pos, int seed) {
    // Pick a random direction uniformly on the sphere,
    // then tweak it so that the normal is > 0
    vec3 dir = rand3_sphere(vec3(seed, compress(pos)));
    if (dot(dir, norm(pos)) < 0) {
        return -dir;
    } else {
        return dir;
    }
}


vec3 color(vec4 pos) {
    switch (int(pos.w)) {
        case ID_TOP:    // fallthrough
        case ID_LIGHT:  // fallthrough
        case ID_BOTTOM: // fallthrough
        case ID_FRONT:  // fallthrough
        case ID_BACK: return vec3(1);

        case ID_LEFT: return vec3(1, 0.3, 0);
        case ID_RIGHT: return vec3(0.3, 1, 0);
        case ID_SPHERE: return vec3(0.3, 0.3, 1);

        default: return vec3(1);
    }
}

////////////////////////////////////////////////////////////////////////////////
// The lowest-level building block:
//  Raytraces to the next object in the scene,
//  returning a vec4 of [end, id]
vec4 trace(vec4 start, vec3 dir) {
    vec4 t;
#define SHAPE(fn) \
        t = fn(start.xyz, dir); \
        if (t.w != 0 && t.w != start.w) { \
            return t; \
        }

    SHAPE(sphere)
    SHAPE(light)
    SHAPE(rear)
    SHAPE(top)
    SHAPE(left)
    SHAPE(right)
    SHAPE(bottom)
    SHAPE(front)
    return vec4(0);
}

////////////////////////////////////////////////////////////////////////////////

#define BOUNCE_FN(FN_NAME, NEXT_FN, SAMPLES) \
vec3 NEXT_FN(vec4 pos);                 \
vec3 FN_NAME(vec4 pos) {                \
    vec3 out_color = vec3(0);           \
    vec3 my_color = color(pos);         \
    for (int i=0; i < SAMPLES; ++i) {   \
        vec3 dir = rand3_norm(pos, i);  \
        vec4 next = trace(pos, dir);    \
                                        \
        vec3 c;                         \
        if (next.w == ID_LIGHT) {       \
            c = vec3(1);                \
        } else if (next.w == 0) {       \
            c = vec3(0);                \
        } else {                        \
            c = NEXT_FN(next);          \
        }                               \
        c *= dot(norm(next), -dir);     \
        out_color += c * my_color;      \
    }                                   \
    return out_color / sqrt(SAMPLES);   \
}
BOUNCE_FN(bounce1, bounce2, 32)
BOUNCE_FN(bounce2, bounce_last, 4)

// Bounce termination with a little diffuse lighting,
// as a treat.
vec3 bounce_last(vec4 pos) {
    return color(pos) / 15;
}

////////////////////////////////////////////////////////////////////////////////

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos_xy = (fragCoord.xy / iResolution.xy)*2 - 1;

    vec3 start = vec3(pos_xy, 1);
    vec3 dir = normalize(vec3(pos_xy/3, -1));

    vec4 pos = trace(vec4(start, 0), dir);
    if (pos.w == ID_LIGHT) {
        fragColor = vec4(0.8) + vec4(vec3(rand(pos.xz)) / 4, 1);
    } else {
        fragColor = vec4(bounce1(pos)*2, 1);
    }
}

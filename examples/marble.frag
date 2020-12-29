//  Created by S. Guillitte 2015
//  https://www.shadertoy.com/view/MtX3Ws
//
//  Licensed under the
//      Creative Commons Attribution-NonCommercial
//      ShareAlike 3.0 Unported License.

const float ZOOM=7;

vec2 csqr(vec2 a) {
    return vec2(a.x*a.x - a.y*a.y,
                2*a.x*a.y);
}

mat2 rot(float a) {
    return mat2(cos(a), sin(a), -sin(a), cos(a));
}

vec2 iSphere(in vec3 ro, in vec3 rd, in vec4 sph) {
    // From iq
    vec3 oc = ro - sph.xyz;
    float b = dot(oc, rd);
    float c = dot(oc, oc) - sph.w*sph.w;
    float h = b*b - c;
    if (h < 0.0) {
        return vec2(-1.0);
    }
    h = sqrt(h);
    return vec2(-b - h, -b + h);
}

float map(in vec3 p) {
    float res = 0;

    vec3 c = p;
    for (int i = 0; i < 10; ++i) {
        p = 0.7 * abs(p) / dot(p, p) - 0.7;
        p.yz = csqr(p.yz);
        p = p.zxy;
        res += exp(-19 * abs(dot(p, c)));
    }
    return res / 2;
}

vec3 raymarch(vec3 ro, vec3 rd, vec2 tminmax) {
    float t = tminmax.x;
    float dt = 0.02;
    vec3 col= vec3(0);
    float c = 0;
    for(int i=0; i < 64; i++) {
        t += dt * exp(-2 * c);
        if (t>tminmax.y) {
            break;
        }
        c = map(ro + t * rd);

        // Accumulate color
        col = col + 0.1 * vec3(c*c*c, c*c, c);
    }
    return col;
}


void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 q = fragCoord.xy / iResolution.xy;
    vec2 p = -1.0 + 2.0 * q;
    p.x *= iResolution.x/iResolution.y;

    // Camera
    vec3 ro = ZOOM * vec3(1);
    ro.xz *= rot(-0.1 * iTime);

    vec3 ww = normalize(ro);
    vec3 uu = normalize(cross(ww, vec3(0.0,1.0,0.0)));
    vec3 vv = normalize(cross(uu, ww));
    vec3 rd = normalize(p.x*uu + p.y*vv + 4.0*ww);

    vec2 tmm = iSphere(ro, rd, vec4(0, 0, 0, 2));

    // Raymarch
    vec3 col = raymarch(ro, rd, tmm);

    // Shade
    col = log(1 + col) / 2;
    fragColor = vec4(col, 1.0);

}

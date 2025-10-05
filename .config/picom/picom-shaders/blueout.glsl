#version 330

in vec2 texcoord;             // current pixel coordinate
uniform sampler2D tex;        // window texture
uniform float opacity;        // window opacity (1.0 = focused if inactive-dim not used)
uniform float corner_radius;  // corner radius in pixels
uniform float time;           // time uniform (not used here)

uniform float border_width = 50.0;   // outline thickness
vec4 border_color = vec4(0.0, 0.4, 1.0, 1.0); // solid blue

ivec2 window_size = textureSize(tex, 0);

// Helper to check rounded corners
bool corner(bool left, bool top, float cx, float cy) {
    return (
        ((left   && texcoord.x < cx) || (!left && texcoord.x > cx))
        && ((top  && texcoord.y < cy) || (!top && texcoord.y > cy))
        && pow(cx-texcoord.x, 2)
           + pow(cy-texcoord.y, 2)
           > pow(corner_radius-border_width, 2)
    );
}

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec4 c = texelFetch(tex, ivec2(texcoord), 0);
    c = default_post_processing(c);

    // Only apply outline if window is focused (opacity == 1.0)
    if (opacity == 1.0 && (
        texcoord.x < border_width
        || texcoord.y < border_width
        || texcoord.x > window_size.x - border_width
        || texcoord.y > window_size.y - border_width
        || corner(true,  true,  corner_radius,               corner_radius)
        || corner(false, true,  window_size.x-corner_radius, corner_radius)
        || corner(false, false, window_size.x-corner_radius, window_size.y-corner_radius)
        || corner(true,  false, corner_radius,               window_size.y-corner_radius)
    )) {
        c = border_color;
    }

    return c;
}


/// JELLYFISH — BIOLUMINESCENT GLOW

// Gentle pulsing animation.
var pulse = 0.85 + 0.15 * sin(current_time * 0.003);
var glow_radius = 100 * pulse;

// Additive blending makes the light brighten the colors beneath it.
gpu_set_blendmode(bm_add);

// Outer, soft halo.
draw_set_alpha(0.025);
draw_set_colour(col_blue);
draw_circle(x, y, glow_radius, true);

// Middle glow.
draw_set_alpha(0.045);
draw_set_colour(col_aqua);
draw_circle(x, y, glow_radius * 0.65, true);

// Inner glow.
draw_set_alpha(0.10);
draw_set_colour(col_glow);
draw_circle(x, y, glow_radius * 0.32, true);

// Reset drawing settings.
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(c_white);

// Draw the actual jellyfish sprite on top.
draw_self();

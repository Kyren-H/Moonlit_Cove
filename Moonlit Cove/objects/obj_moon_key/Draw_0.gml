
// MOONLIT COVE — COLLECTIBLE EFFECTS
// Draw Event

var px = x;
var py = y + y_offset;

// Choose a glow color for each collectible
var glow_colour = col_glow;

if (object_index == obj_moon_pearl) {
    glow_colour = col_moon;
}
else if (object_index == obj_moon_key) {
    glow_colour = make_colour_rgb(255, 190, 90);
}

// --------------------------------------------
// SOFT PULSING HALO
// --------------------------------------------
gpu_set_blendmode(bm_add);

for (var i = 3; i >= 1; i--) {
    draw_set_alpha(glow_alpha * 0.18);

    draw_set_colour(glow_colour);

    draw_circle(
        px,
        py,
        (8 + i * 7) * glow_size,
        false
    );
}

// --------------------------------------------
// ORIGINAL COLLECTIBLE SPRITE
// --------------------------------------------
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(c_white);

draw_sprite_ext(
    sprite_index,
    image_index,
    px,
    py,
    image_xscale,
    image_yscale,
    image_angle,
    c_white,
    1
);

// --------------------------------------------
// SPARKLES
// --------------------------------------------
for (var i = 0; i < array_length(sparkle_list); i++) {
    var s = sparkle_list[i];

    var sparkle_alpha = s.life / s.max_life;

    draw_set_alpha(sparkle_alpha);
    draw_set_colour(col_mint);

    // Tiny diamond-shaped sparkle
    draw_line(
        px + s.x - s.size,
        py + s.y,
        px + s.x + s.size,
        py + s.y
    );

    draw_line(
        px + s.x,
        py + s.y - s.size,
        px + s.x,
        py + s.y + s.size
    );
}

// Reset drawing settings
draw_set_alpha(1);
draw_set_colour(c_white);
gpu_set_blendmode(bm_normal);

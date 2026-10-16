// =================================
// DARKNESS SEGMENT - CTD
// =================================
gpu_set_blendenable(true);
draw_set_alpha(1);

if (!surface_exists(sfc_Darkness)) {
    sfc_Darkness = surface_create(room_width, room_height);
}
surface_set_target(sfc_Darkness);

// Set the darkness color and the blending mode.
// CHANGED: Deep Navy Color
draw_clear_alpha(darkness_colour, darkness_strength);
gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);


// Get the little guy's position for drawing.
var sfc_X = obj_player.x;
var sfc_Y = obj_player.y;

// Get the radius to ake a cirlce for the darkness
var sfc_radius = (global.abilities.moon_glow) ? darkness_edge_LR*moonglow_mod : darkness_edge_LR;
var sfc_rings = [[1.00, 0.35], [0.80, 0.50], [0.60, 0.60], [0.40, 1.00]];

for (var r = 0; r < array_length(sfc_rings); r++){
	var sfc_size = sfc_radius * sfc_rings[r][0];
	draw_set_alpha(sfc_rings[r][1]);
	draw_ellipse(sfc_X - sfc_size, sfc_Y - sfc_size, sfc_X + sfc_size, sfc_Y + sfc_size, false);
}

with (obj_light) {
	for (var r = 0; r < array_length(sfc_rings); r++) {
		var sfc_size = radius * sfc_rings[r][0];
		draw_set_alpha(sfc_rings[r][1] * intensity);
		draw_ellipse(x - sfc_size, y - sfc_size, x + sfc_size, y + sfc_size, false);
	}
}


gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
surface_reset_target();
gpu_set_blendenable(true);

draw_surface_part_ext(
	sfc_Darkness, 
	camera_get_view_x(view_camera[0]), 
	camera_get_view_y(view_camera[0]), 
	camera_get_view_width(view_camera[0]), 
	camera_get_view_height(view_camera[0]), 
	0, 0, 
	display_get_gui_width() / camera_get_view_width(view_camera[0]), 
	display_get_gui_height() / camera_get_view_height(view_camera[0]), 
	c_white, 1);
	
 // ================================================
 // MOONLIT COVE — COMBINED HUD
 // Timer / Lives / Collectibles
 // ================================================

var sw = display_get_gui_width();
var sh = display_get_gui_height();

// --------------------------------------------
// PANEL SIZE AND POSITION
// --------------------------------------------
var hud_x = 28;
var hud_y = 28;
var hud_w = 400;
var hud_h = 230;

var pad = 16;

// --------------------------------------------
// PANEL BACKGROUND
// --------------------------------------------
draw_set_alpha(0.96);
draw_set_colour(hud_deep);
draw_roundrect(
    hud_x, hud_y,
    hud_x + hud_w, hud_y + hud_h,
    false
);

// Outer border
draw_set_alpha(1);
draw_set_colour(hud_glow);
draw_roundrect(
    hud_x, hud_y,
    hud_x + hud_w, hud_y + hud_h,
    true
);

// Inner border
draw_set_colour(hud_ocean);
draw_roundrect(
    hud_x + 4, hud_y + 4,
    hud_x + hud_w - 4, hud_y + hud_h - 4,
    true
);

// --------------------------------------------
// TIMER — TOP
// --------------------------------------------
var timer_x = hud_x + pad;
var timer_y = hud_y + 12;

draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Moon icon
draw_set_colour(hud_moon);
draw_circle(timer_x + 10, timer_y + 12, 9, false);

draw_set_colour(hud_deep);
draw_circle(timer_x + 14, timer_y + 8, 8, false);

// Timer label
draw_set_colour(hud_aqua);
draw_text(
    timer_x + 28,
    timer_y + 12,
    "UNTIL MIDNIGHT"
);

// Countdown MM:SS
var total_seconds = max(0, ceil(time_remaining));
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60;

var seconds_text = string(seconds);
if (seconds < 10) {
    seconds_text = "0" + seconds_text;
}

var timer_text = string(minutes) + ":" + seconds_text;

// Highlight the final 15 seconds
draw_set_font(fnt_header);
draw_set_colour(
    time_remaining <= 15 ? hud_moon : hud_text
);

draw_text(
    timer_x + 270,
    timer_y + 25,
    timer_text
);

// --------------------------------------------
// DIVIDER
// --------------------------------------------
draw_set_colour(hud_blue);
draw_line(
    hud_x + pad,
    hud_y + 79,
    hud_x + hud_w - pad,
    hud_y + 79
);

// --------------------------------------------
// LIVES — MIDDLE
// --------------------------------------------
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_colour(hud_aqua);

draw_text(
    hud_x + pad,
    hud_y + 96,
    "LIVES"
);

var life_start_x = hud_x + 112;
var life_y = hud_y + 105;

for (var i = 0; i < max_lives; i++) {

    var lx = life_start_x + i * 32;

    if (i < lives) {
        draw_set_colour(hud_moon);
    }
    else {
        draw_set_colour(hud_grey);
    }

    // Filled moon
    draw_circle(lx, life_y, 9, false);

    // Crescent cutout
    draw_set_colour(hud_deep);
    draw_circle(lx + 5, life_y - 4, 8, false);
}

// --------------------------------------------
// DIVIDER
// --------------------------------------------
draw_set_colour(hud_blue);
draw_line(
    hud_x + pad,
    hud_y + 128,
    hud_x + hud_w - pad,
    hud_y + 128
);


 // --------------------------------------------
 // COLLECTIBLES — BOTTOM
 // No labels
 // --------------------------------------------

var icon_y = hud_y + 172;
var slot_w = (hud_w - pad * 2) / 3;

// Background tile dimensions
var tile_size = 72;
var tile_padding = 4;

// Maximum sprite dimensions inside each tile
var icon_max_w = tile_size - tile_padding * 2;
var icon_max_h = tile_size - tile_padding * 2;

var icon_sprites = [
    spr_moon_glow,
    spr_moon_pearl,
    spr_moon_key
];

var icon_collected = [
    global.abilities.moon_glow,
    global.abilities.moon_dash,
    global.abilities.moon_key
];

for (var i = 0; i < 3; i++) {

    var spr = icon_sprites[i];
    var collected = icon_collected[i];

    var icon_x = hud_x + pad + slot_w * (i + 0.5);

    // ----------------------------------------
    // BACKGROUND TILE
    // ----------------------------------------
    draw_set_alpha(0.8);
    draw_set_colour(hud_ocean);

    draw_roundrect(
        icon_x - tile_size * 0.5,
        icon_y - tile_size * 0.5,
        icon_x + tile_size * 0.5,
        icon_y + tile_size * 0.5,
        false
    );

    // Subtle tile outline
    draw_set_alpha(0.8);
    draw_set_colour(hud_glow);

    draw_roundrect(
        icon_x - tile_size * 0.5,
        icon_y - tile_size * 0.5,
        icon_x + tile_size * 0.5,
        icon_y + tile_size * 0.5,
        true
    );

    // ----------------------------------------
    // SCALE SPRITE TO FIT THE TILE
    // Preserve aspect ratio
    // ----------------------------------------
    var spr_w = sprite_get_width(spr);
    var spr_h = sprite_get_height(spr);

    var icon_scale = min(
        icon_max_w / spr_w,
        icon_max_h / spr_h
    );

    var scaled_w = spr_w * icon_scale;
    var scaled_h = spr_h * icon_scale;

    // Grey when missing, original colors when collected
    var tint = collected
        ? c_white
        : make_colour_rgb(95, 105, 120);

    // Center the sprite based on its origin
    var draw_x = icon_x
        + (spr_w * 0.5 - sprite_get_xoffset(spr)) * icon_scale;

    var draw_y = icon_y
        + (spr_h * 0.5 - sprite_get_yoffset(spr)) * icon_scale;

    draw_set_alpha(1);

    draw_sprite_ext(
        spr,
        0,
        draw_x,
        draw_y,
        icon_scale,
        icon_scale,
        0,
        tint,
        1
    );
}

// --------------------------------------------
// RESTORE DRAW STATE
// --------------------------------------------
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);


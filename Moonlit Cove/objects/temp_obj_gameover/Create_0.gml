// MOONLIT COVE - GAME OVER / WIN SCREEN

// Main ocean backgrounds
col_bg    = #101b3d;  // Deep ocean
col_deep  = #182957;  // Midnight blue
col_ocean = #28518a;  // Ocean blue
col_blue  = #4f83b5;  // Soft ocean blue

// Magical highlights
col_glow  = #8bd3e6;  // Star blue / UI glow
col_aqua  = #8cc8d9;  // Water highlights
col_mint  = #ddf4e8;  // Pale seafoam

// Moon and text
col_moon  = #f4eedb;  // Moon cream
col_text  = #f3f6e8;  // Soft white

// -- Colours --
col_btn   = make_colour_rgb(40, 70, 170);
col_hover = make_colour_rgb(70, 110, 170);

// -- Style For Text To Bobble Around --
draw_bobbing_text = function(str, mx, my, scale, phase) {
	var total = string_width(str) * scale;
	var xx = mx - total / 2;
	for (var i = 1; i <= string_length(str); i++) {
		var char = string_char_at(str, i);
		var bob = sin(t * 0.045 + phase + i * 0.55) * 8;
		draw_text_transformed(xx, my + bob, char, scale, scale, 0);
		xx += string_width(char) * scale;
	}
};

has_won = (room == win_room);

// ---------------------
// BUTTONS
// ---------------------
buttons = [has_won ? "Play Again" : "Try Again", "Title Screen"]

t = 0;
btn_width  = 260;
btn_height = 64;
btn_gap    = 28;
selected   = 0;
hover      = -1;

// Center the entire row
var total_width = array_length(buttons) * btn_width
                + (array_length(buttons) - 1) * btn_gap;

// Keep this function if other code references btn_top.
// All buttons share the same vertical position.
btn_top = function(i) {
    return btn_y;
};

btn_x = (1920 - total_width) * 0.5;
btn_y = 700;

// Position each button from left to right
btn_left = function(i) {
    return btn_x + i * (btn_width + btn_gap);
};

// ----------------------
//    CLLECTED ITEMS 
// ----------------------
item_sprites = [spr_moon_glow, spr_moon_pearl, spr_moon_key];
item_size = 64
item_gap = 140;
item_row_y = 625;

// Sees what the player has collected
if(variable_global_exists("abilities")) {
	item_have = [
        global.abilities.moon_glow,
        global.abilities.moon_pearl,
        global.abilities.moon_key
    ];

} else {
	item_have = [false, false, false]	 
 }

item_count = 0;
for (var n = 0; n < 3; n++){
	if (item_have[n]) item_count++;
}


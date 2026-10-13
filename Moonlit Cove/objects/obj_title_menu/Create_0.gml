
// ================================================
// MOONLIT COVE — COLOR PALETTE
// ================================================

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

// -- Size + Select + Hover [Variables] --
get_width  = display_get_gui_width();
get_height = display_get_gui_height();
buttons    = ["How To Play", "Start Game", "Credits"];
selected   = 1;
hover      = -1;


// -- Horizontal Menu Buttons --
buttons = ["How To Play", "Start Game", "Credits"];

btn_width  = 260;
btn_height = 64;
btn_gap    = 28;

// Center the entire row
var total_width = array_length(buttons) * btn_width
                + (array_length(buttons) - 1) * btn_gap;

btn_x = (1920 - total_width) * 0.5;
btn_y = 830;

// Position each button from left to right
btn_left = function(i) {
    return btn_x + i * (btn_width + btn_gap);
};

// Keep this function if other code references btn_top.
// All buttons share the same vertical position.
btn_top = function(i) {
    return btn_y;
};

// Initial menu state
selected = 1;
hover = -1;


// -- State Of Game [Variables] --
panel    = "none";
t        = 0;
starting = false;
fade     = 0;
last_mx  = 0;
last_my  = 0;

// -- Colours --
col_bg    = make_colour_rgb(18, 27, 61);
col_text  = make_colour_rgb(240, 240, 225);
col_btn   = make_colour_rgb(40, 70, 170);
col_hover = make_colour_rgb(70, 110, 170);
col_glow  = make_colour_rgb(143, 193, 232);

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

// -- Credits Of Game [Array] --
credits = [
	["Art:",                   "Abi Muthuraman"],
	["Programming:",           "Connor Dunn"],
	["Game and Level Design:", "Walter Leiva"],
	["Team Lead and Support:", "Kyren Hart"]
];
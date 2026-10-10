// -- Size + Select + Hover [Variables] --
get_width  = display_get_gui_width();
get_height = display_get_gui_height();
buttons    = ["Start Game", "How to Play", "Credits"];
selected   = 0;
hover      = -1;

// -- Buttons [Variables] --
btn_width  = 300;
btn_height = 64;
btn_gap    = 20;
btn_x      = (get_width / 2) - (btn_width / 2);
btn_y      = get_height * 0.55;
btn_top = function(i) {
	return btn_y + i * (btn_height + btn_gap);
};

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
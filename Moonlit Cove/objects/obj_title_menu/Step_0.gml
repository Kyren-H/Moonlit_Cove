t++;
// -- Fading Into The Game --
if (starting) {
	fade = min(fade + 0.05, 1);
	if (fade >= 1) {
		game_state_reset();
		room_goto(Playroom_1);
	}
	exit;
}

// -- Input [Variables] --
var mx      = device_mouse_x_to_gui(0);
var my      = device_mouse_y_to_gui(0);
var confirm = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);
var up      = keyboard_check_pressed(vk_up)   or keyboard_check_pressed(ord("W"));
var down    = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));

// -- Open and Close Panel --
if (panel != "none") {
	if (confirm or keyboard_check_pressed(vk_escape) or mouse_check_button_pressed(mb_left)) {
		panel = "none";
	}
	exit;
}

// -- Mouse Hovering Actions --
hover = -1;
var length = array_length(buttons);
for (var i = 0; i < length; i++) {
	if (point_in_rectangle(mx, my, btn_x, btn_top(i), btn_x + btn_width, btn_top(i) + btn_height)) {
		hover = i;
	}
}
if (hover != -1 and (mx != last_mx or my != last_my)) {
	selected = hover;
}
last_mx = mx;
last_my = my;
selected = (selected + down - up + length) mod length;

// -- Activation Cases / State of Game --
if (confirm or (hover != -1 and hover == selected and mouse_check_button_pressed(mb_left))) {
	switch (selected) {
		case 0: starting = true;   break;
		case 1: panel = "how";     break;
		case 2: panel = "Credits"; break;
	}
}
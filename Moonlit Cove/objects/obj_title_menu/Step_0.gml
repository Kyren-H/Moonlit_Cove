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


// -- Mouse Hover Detection --
hover = -1;
var length = array_length(buttons);

for (var i = 0; i < length; i++) {
    var left = btn_left(i);
    var top = btn_top(i);

    if (point_in_rectangle(
        mx, my,
        left, top,
        left + btn_width, top + btn_height
    )) {
        hover = i;
        break;
    }
}

// -- Mouse Hover Selection --
if (hover != -1) {
    selected = hover;
}

// -- Keyboard Navigation --
// Left/right moves through the horizontal row.
var left_key = keyboard_check_pressed(vk_left)
            || keyboard_check_pressed(ord("A"));

var right_key = keyboard_check_pressed(vk_right)
             || keyboard_check_pressed(ord("D"));

if (hover == -1) {
    if (right_key) {
        selected = (selected + 1) mod length;
    }

    if (left_key) {
        selected = (selected - 1 + length) mod length;
    }
}

// -- Activation Cases / State of Game --
if (confirm or (hover != -1 and hover == selected and mouse_check_button_pressed(mb_left))) {
	switch (selected) {
		case 0: panel = "how";   break;
		case 1: starting = true;    break;
		case 2: panel = "Credits"; break;
	}
}
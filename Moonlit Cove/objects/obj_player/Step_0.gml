// ---MOVEMENT SECTION--- //

// Collect key inputs per frame.
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));

// Condense inputs into modifier factors.
var x_factor = key_right - key_left;
var y_factor = key_down - key_up;

// Processes input for movement.
var moveArray = [0, 0];
basic_movement(x_factor, y_factor, moveArray)

move_and_collide(moveArray[0], moveArray[1], obj_classification_collideable)


// ---VISUAL SECTION--- //

// Swaps sprite direction.
if (x_factor != 0) then image_xscale = x_factor;

// Swaps sprite to movement mode.
if (x_factor != 0 or y_factor != 0) {
	sprite_index = spr_player_movement;
} else {
	sprite_index = spr_player_idle;
}

show_debug_message("player at " + string(x) + ", " + string(y) + " in " + room_get_name(room))
draw_self()

if(global.debug){
	draw_circle_color(x, y, 20, c_red, c_red, false)
}
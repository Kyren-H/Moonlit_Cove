if (state == "Closing" and image_index <= 1) {
	show_debug_message("WALL SHOULD CLOSE.");
	state = "Closed";
	
	sprite_index = spr_wall;
	
	image_speed = 1
}
if (state == "Opening" and image_index >= image_number - 1) {
	show_debug_message("WALL SHOULD OPEN.");
	state = "Open";
	
	sprite_index = spr_wall_open;
	
	image_speed = -1
}
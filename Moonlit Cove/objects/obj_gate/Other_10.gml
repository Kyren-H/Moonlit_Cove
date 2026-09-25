// Change state.
show_debug_message("WALL EVENT TRIGGERED.");
if (state == "Closed") {
	state = "Opening";
	
	sprite_index = spr_wall_opening;
	
	image_index = 0;
} else if (state == "Open") {
	state = "Closing";
	
	sprite_index = spr_wall_opening;
	
	image_index = image_number - 1;
}
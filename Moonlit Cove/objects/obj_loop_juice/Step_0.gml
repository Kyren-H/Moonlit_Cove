time++;
progress = time/duration_frames;

// End the juice once its welcome is over.
if (time >= duration_frames) {
	instance_destroy();
	exit;
}

// Calculate a random offset with increasing severity and apply it to the camera position.
if (progress < 0.8) {
	var magnitude = shake_mag * progress;
	var cam_x = camera_get_view_x(camera);
	var cam_y = camera_get_view_y(camera);

	x_factor = random_range(-magnitude, magnitude);
	y_factor = random_range(-magnitude, magnitude);

camera_set_view_pos(camera, cam_x + x_factor, cam_y + y_factor); 
}

if (progress == 0.8 && !obj_game_controller.game_over) {
	obj_player.x = obj_game_controller.starting_x;
	obj_player.y = obj_game_controller.starting_y;
	obj_jellyfish.path_position = 0;
	game_state_reset();
}

if (progress == 0.8 && obj_game_controller.game_over) {
	room_goto(game_over_room);
	instance_destroy();
}
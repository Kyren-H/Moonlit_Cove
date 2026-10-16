time++;
progress = time/duration_frames;

// End the juice once its welcome is over.
if (time >= duration_frames) {
	room_goto(win_room);
	instance_destroy();
	exit;
}
alarm[0] = 15;

for (var iteration = 0; iteration < array_length(wall_segments); iteration++) {
	// "with" changes execution context to as though this were executing in the other object.
	// In this case, this is a wall segment to be activated.
	with (wall_segments[iteration]) {
		event_perform(ev_other, ev_user0);
	}
}
// Start action (user event 0) when hit, then disable being able to be hit for a limited time.
if (can_be_hit) {
	event_user(0);
	can_be_hit = false;
	alarm[11] = frames_to_reform;
}
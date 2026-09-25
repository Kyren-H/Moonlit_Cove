// Start action (user event 0) when hit, then disable being able to be hit for a limited time.
if (interactable) {
	event_user(0);
	interactable = false;
	alarm[11] = interaction_delay;
}
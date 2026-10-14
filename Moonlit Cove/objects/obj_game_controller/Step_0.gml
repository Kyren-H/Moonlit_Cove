
 // ================================================
 // MOONLIT COVE — MIDNIGHT / LIFE LOSS
 // ================================================

if (!game_over) {

    time_remaining -= delta_time / 100000//0;

    
	// Midnight reached
	if (time_remaining <= 0) {

	    // Lose one life
	    lives = max(0, lives - 1);

	    if (lives <= 0) {
	        lives = 0;
	        game_over = true;

	        // Trigger your Game Over state here.
			room_goto(game_over_room);
	    }
	    else {
	        // Reset the clock
	        time_remaining = day_duration;

	        // Reset collectible HUD state
	        has_moon_glow = false;
	        has_moon_pearl = false;
	        has_moon_key = false;

	        // Reset collectible objects in the world.
	        // Call your existing world-reset function here.
	        game_state_reset();
	    }
	}
}

// --------------------------------------------
// DEBUG SHORTCUTS — TEST COLLECTIBLES
// --------------------------------------------

// Press 1 to toggle Moon Glow
if (keyboard_check_pressed(ord("1"))) {
    has_moon_glow = !has_moon_glow;
}

// Press 2 to toggle Moon Pearl
if (keyboard_check_pressed(ord("2"))) {
    has_moon_pearl = !has_moon_pearl;
}

// Press 3 to toggle Moon Key
if (keyboard_check_pressed(ord("3"))) {
    has_moon_key = !has_moon_key;
}

// Press 0 to reset all collectibles
if (keyboard_check_pressed(ord("0"))) {
    has_moon_glow = false;
    has_moon_pearl = false;
    has_moon_key = false;
}

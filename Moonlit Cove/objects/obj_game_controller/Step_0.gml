
 // ================================================
 // MOONLIT COVE — MIDNIGHT / LIFE LOSS
 // ================================================

if (!game_over) {

    time_remaining -= delta_time / 1000000;

    
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

	        // Reset collectible objects in the world.
	        // Call your existing world-reset function here.
<<<<<<< HEAD
	        loop_reset();
=======
	        game_restart();
>>>>>>> e4068e1e91336720303e104a2f30db90f3591c20
	    }
	}
}

// --------------------------------------------
// DEBUG SHORTCUTS — TEST COLLECTIBLES
// --------------------------------------------

// Press 1 to toggle Moon Glow
if (keyboard_check_pressed(ord("1"))) {
   global.abilities.moon_glow = !global.abilities.moon_glow;
}

// Press 2 to toggle Moon Pearl
if (keyboard_check_pressed(ord("2"))) {
   global.abilities.moon_dash = !global.abilities.moon_dash;
}

// Press 3 to toggle Moon Key
if (keyboard_check_pressed(ord("3"))) {
    global.abilities.moon_key  = !global.abilities.moon_key;
}

// Press 0 to reset all collectibles
if (keyboard_check_pressed(ord("0"))) {
	global.abilities.moon_glow = false;
    global.abilities.moon_dash = false;
    global.abilities.moon_key  = false;
}

if (keyboard_check_pressed(ord("L"))){
	lives = 1;
	time_remaining = 5;
}


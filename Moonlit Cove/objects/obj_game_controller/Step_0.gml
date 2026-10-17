
 // MOONLIT COVE — MIDNIGHT / LIFE LOSS
time_remaining = global.time_remaining;

if (!game_over) {
	
	if (!timer_paused) {
	    time_remaining -= delta_time / 1000000;
		global.time_remaining = time_remaining;

    
		// Midnight reached
		if (time_remaining <= 0) {

		    // Lose one life
		    lives = max(0, lives - 1);

		    if (lives <= 0) {
		        lives = 0;
		        game_over = true;

		        // Trigger your Game Over state here.
				instance_create_layer(obj_player.x, obj_player.y, "Effects_Controls", obj_loop_juice);
		    }
		    else {
		        // Reset the clock
		        time_remaining = day_duration;
				global.time_remaining = time_remaining;

		        // Reset collectible objects in the world.
		        // Call your existing world-reset function here.
			
			loop_reset();
			instance_create_layer(obj_player.x, obj_player.y, "Effects_Controls", obj_loop_juice);
		    }
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
   global.abilities.moon_pearl = !global.abilities.moon_pearl;
}

// Press 3 to toggle Moon Key
if (keyboard_check_pressed(ord("3"))) {
    global.abilities.moon_key  = !global.abilities.moon_key;
}

// Press 0 to reset all collectibles
if (keyboard_check_pressed(ord("0"))) {
	global.abilities.moon_glow = false;
    global.abilities.moon_pearl = false;
    global.abilities.moon_key  = false;
}

// Press 5 to set the countdown to five seconds.
if (keyboard_check_pressed(ord("5"))) {
	time_remaining = 5;
	global.time_remaining = time_remaining;
}

if (keyboard_check_pressed(ord("L"))){
	lives = 1;
}

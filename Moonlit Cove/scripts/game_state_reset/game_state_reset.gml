function game_state_reset(){
	global.loop_number = 1;

	// -- Event --
	global.knowledge = {
		met_lumi: false,
		seen_pip_crash: false,
		talked_to_tide: false
	};

	// -- Abilities --
	global.abilities = {
		moon_glow: false,
		moon_pearl: false,
		moon_key:  false
	};
	
	instance_activate_object(obj_moon_glow);
	instance_activate_object(obj_moon_key);
	instance_activate_object(obj_moon_pearl);
}

function loop_reset(){
	global.loop_number += 1;
	if (!global.abilities.moon_glow) {
		instance_activate_object(obj_moon_glow);
	}
	if (!global.abilities.moon_pearl) {
		instance_activate_object(obj_moon_pearl);
	}
	if (!global.abilities.moon_key) {
		instance_activate_object(obj_moon_key);
	}
	/// RESPAWN COLLECTIBLES FOR THE NEXT LOOP

	with (obj_moon_glow) {
		collected = false;
		visible = true;
	}

	with (obj_moon_pearl) {
		collected = false;
		visible = true;
	}

	with (obj_moon_key) {
		collected = false;
		visible = true;
	}
}
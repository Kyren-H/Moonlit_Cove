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
		moon_dash: false,
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
	if (!global.abilities.moon_dash) {
		instance_activate_object(obj_moon_pearl);
	}
	if (!global.abilities.moon_key) {
		instance_activate_object(obj_moon_key);
	}
}
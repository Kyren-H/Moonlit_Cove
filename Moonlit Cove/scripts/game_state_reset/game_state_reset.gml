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
}
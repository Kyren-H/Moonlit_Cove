if (global.abilities.moon_glow && global.abilities.moon_dash && global.abilities.moon_key) {
	if (!instance_exists(obj_win_juice)) {
		instance_create_layer(obj_player.x, obj_player.y, "Effects_Controls", obj_win_juice);
	}
}
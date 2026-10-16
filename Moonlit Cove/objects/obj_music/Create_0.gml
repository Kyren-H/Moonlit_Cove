if (instance_number(obj_music) > 1){
	instance_destory();
	exit;
}

// Only start the theme if it isn't already playing
if(audio_is_playing(snd_theme)){
	theme = audio_play_sound(snd_theme, 0.6, 2000);
	audio_sound_gain(theme, 0, 0);
	audio_sound_gain(theme, 0.6, 2000);
}
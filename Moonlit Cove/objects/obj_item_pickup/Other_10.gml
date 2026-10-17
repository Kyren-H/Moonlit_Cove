if (pending_pickup) {
    exit;
}

audio_play_sound(snd_item_effect, 10, false);

pending_pickup = true;
waiting_for_space_release = keyboard_check(vk_space);

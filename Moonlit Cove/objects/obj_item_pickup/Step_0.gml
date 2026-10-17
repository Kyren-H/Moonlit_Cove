if (!pending_pickup) {
    exit;
}

if (waiting_for_space_release) {
    if (!keyboard_check(vk_space)) {
        waiting_for_space_release = false;
    }
    exit;
}

if (keyboard_check_pressed(vk_space)) {
    instance_destroy();
}

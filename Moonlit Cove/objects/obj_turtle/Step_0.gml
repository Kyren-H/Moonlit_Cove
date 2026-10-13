
// --------------------------------------------
// TURTLE — STEP EVENT
// Proximity + dialogue progression
// --------------------------------------------

var was_near = player_near;
player_near = false;

if (instance_exists(obj_player)) {
    var dist = point_distance(
        x, y,
        obj_player.x, obj_player.y
    );

    player_near = (dist <= interaction_range);
}

// Start dialogue when the player enters range
if (player_near && !was_near) {
    dialogue_active = true;
    dialogue_page = 0;
}

// Close dialogue when the player leaves
if (!player_near) {
    dialogue_active = false;
    dialogue_page = 0;
}

// Click, Space, or Enter to advance
if (dialogue_active) {
    if (
        mouse_check_button_pressed(mb_left)
        || keyboard_check_pressed(vk_space)
        || keyboard_check_pressed(vk_enter)
    ) {
        if (dialogue_page < array_length(dialogue_pages) - 1) {
            dialogue_page++;
        } else {
            dialogue_active = false;
        }
    }
}

// Animate the sparkles
for (var i = 0; i < array_length(dialogue_sparkles); i++) {
    var s = dialogue_sparkles[i];
    s.phase += s.speed;
    dialogue_sparkles[i] = s;
}

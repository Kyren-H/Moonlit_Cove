
/// obj_camera_controller — Step Event

if (instance_exists(obj_player)) {

    // Center the camera on the player
    var target_x = obj_player.x - cam_w * 0.5;
    var target_y = obj_player.y - cam_h * 0.5;

    // Keep the camera inside the room
    target_x = clamp(target_x, 0, max(0, room_width - cam_w));
    target_y = clamp(target_y, 0, max(0, room_height - cam_h));

    // Smoothly move the camera toward the target
    var current_x = camera_get_view_x(cam);
    var current_y = camera_get_view_y(cam);

    var new_x = lerp(current_x, target_x, follow_speed);
    var new_y = lerp(current_y, target_y, follow_speed);

    // Apply the camera position
    camera_set_view_pos(cam, new_x, new_y);
}

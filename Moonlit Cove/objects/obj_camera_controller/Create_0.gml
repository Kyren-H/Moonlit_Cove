
/// obj_camera_controller — Create Event

// Size of the visible game area, in room pixels
cam_w = 480;
cam_h = 270;

// Smooth-follow settings
follow_speed = 0.10;

// Create the camera
cam = camera_create_view(
    0, 0,
    cam_w, cam_h,
    0,
    obj_player,
    -1, -1,
    -1, -1
);

// Assign the camera to view 0
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;

view_wport[0] = 1920;
view_hport[0] = 1080;
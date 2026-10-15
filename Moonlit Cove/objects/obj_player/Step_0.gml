
/// MOVEMENT

key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

var x_factor = key_right - key_left;
var y_factor = key_down - key_up;

var moveArray = [0, 0];
basic_movement(x_factor, y_factor, moveArray);

var move_x = moveArray[0];
var move_y = moveArray[1];

/// WALL COLLISION

// Check the four corners of the player's collision bounding box.
var hits_wall = method(self, function(_dx, _dy) {
    var l = bbox_left + _dx;
    var r = bbox_right + _dx;
    var t = bbox_top + _dy;
    var b = bbox_bottom + _dy;

    var points_x = [l, r];
    var points_y = [t, b];

    for (var i = 0; i < 2; i++) {
        for (var j = 0; j < 2; j++) {
            var tile = tilemap_get_at_pixel(
                wall_tilemap,
                points_x[i],
                points_y[j]
            );
			
            if (tile != 0) {
                return true;
            }
        }
    }

    return false;
});

// Horizontal movement
if (!hits_wall(move_x, 0)) {
    x += move_x;
}

// Vertical movement
if (!hits_wall(0, move_y)) {
    y += move_y;
}

/// VISUALS

if (x_factor != 0) {
    image_xscale = abs(image_xscale) * sign(x_factor) * -1;
}

if (x_factor != 0 || y_factor != 0) {
    sprite_index = spr_player_movement;
} else {
    sprite_index = spr_player_idle;
}
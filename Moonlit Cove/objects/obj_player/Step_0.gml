
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

// Walls are always solid; gates are solid until Tsuki has their ability.
var solid_maps = [wall_tilemap];
if (!global.abilities.moon_glow){
	array_push(solid_maps, gate_glow_tilemap);
}
if (!global.abilities.moon_dash) {
	array_push(solid_maps, gate_dash_tilemap);
}

// Check the four corners of the player's collision bounding box.
var hits_wall = method({inst : id, maps : solid_maps}, function(_dx, _dy) {
	var points_x = [inst.bbox_left + _dx, inst.bbox_right + _dx];
	var points_y = [inst.bbox_top + _dy, inst.bbox_bottom + _dy];
	
	for (var m = 0; m < array_length(maps); m++){
		for (var i = 0; i < 2; i++){
			for (var j = 0; j < 2; j++){
				if (tilemap_get_at_pixel(maps[m], points_x[i], points_y[j]) != 0){
					return true;
				}
			}
		}
	}
	return false;
});

layer_set_visible("Tile_Gate_Glow", !global.abilities.moon_glow);
layer_set_visible("Tile_Gate_Dash", !global.abilities.moon_dash);

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
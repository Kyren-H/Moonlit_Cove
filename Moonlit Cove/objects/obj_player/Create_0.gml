// Tile layers Tsuki can bump into
wall_tilemap = layer_tilemap_get_id("Tiles_Wall");
gate_glow_tilemap = layer_tilemap_get_id("Tiles_Glow");
gate_time_tilemap = layer_tilemap_get_id("Tiles_Time");
gate_all_tilemap = layer_tilemap_get_id("Tiles_All");

can_spin = true;

global.abilities = {
    moon_glow: false,
    moon_pearl: false,
    moon_key: false
};

gate_1_unlock_time = 15 * room_speed;
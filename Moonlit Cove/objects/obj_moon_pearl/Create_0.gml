event_inherited();
// ================================================
// MOONLIT COVE — COLLECTIBLE EFFECTS
// Create Event
// ================================================

image_speed = 0;

event_inherited();
// Random starting phase so collectibles animate differently
glow_phase = random(360);
float_phase = random(360);

// Glow settings
glow_size = 1;
glow_alpha = 0.35;

// Sparkle settings
sparkle_timer = irandom_range(5, 20);
sparkle_list = [];

// Store the original sprite dimensions
collectible_w = sprite_get_width(sprite_index);
collectible_h = sprite_get_height(sprite_index);

// Main ocean backgrounds
col_bg    = #101b3d;  // Deep ocean
col_deep  = #182957;  // Midnight blue
col_ocean = #28518a;  // Ocean blue
col_blue  = #4f83b5;  // Soft ocean blue

// Magical highlights
col_glow  = #8bd3e6;  // Star blue / UI glow
col_aqua  = #8cc8d9;  // Water highlights
col_mint  = #ddf4e8;  // Pale seafoam

// Moon and text
col_moon  = #f4eedb;  // Moon cream
col_text  = #f3f6e8;  // Soft white
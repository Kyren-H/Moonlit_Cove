
 // ================================================
 // MOONLIT COVE — HUD / TIME / LIVES
 // ================================================

// Timer settings
day_duration = 120;       // Seconds until midnight
time_remaining = day_duration;

// Lives
max_lives = 3;
lives = max_lives;

// Collectibles
has_moon_glow = false;
has_moon_pearl = false;
has_moon_key = false;

// Game state
game_over = false;

// HUD colors
hud_bg    = #101b3d;
hud_deep  = #182957;
hud_ocean = #28518a;
hud_blue  = #4f83b5;
hud_glow  = #8bd3e6;
hud_aqua  = #8cc8d9;
hud_mint  = #ddf4e8;
hud_moon  = #f4eedb;
hud_text  = #f3f6e8;
hud_grey  = #69758b;

// DARKNESS INIT - CTD
sfc_Darkness = surface_create(room_width, room_height);

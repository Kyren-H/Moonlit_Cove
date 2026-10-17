
 // MOONLIT COVE — HUD / TIME / LIVES

// Timer settings
day_duration = 120;       // Seconds until midnight
global.time_remaining = day_duration;

// Player positional cache -- allows returning to start.
starting_x = obj_player.x;
starting_y = obj_player.y;

// Timer pause -- for the JUICE.
timer_paused = false;

// Lives
max_lives = 3;
lives = max_lives;

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

// DARKNESS INIT
sfc_Darkness = surface_create(room_width, room_height);
darkness_colour = make_colour_rgb(14, 20, 52);
darkness_strength = 0.9;

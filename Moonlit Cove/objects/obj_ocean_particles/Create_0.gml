
/// obj_ocean_particles — Create Event

// Number of particles
bubble_count = 100;
sparkle_count = 200;

// Particle arrays
bubbles = [];
sparkles = [];

// Use room dimensions
var room_w = room_width;
var room_h = room_height;

// --------------------------------------------
// CREATE BUBBLES
// --------------------------------------------
for (var i = 0; i < bubble_count; i++) {
    array_push(bubbles, {
        x: random(room_w),
        y: random(room_h),
        radius: random_range(1.5, 4),
        speed: random_range(0.25, 0.8),
        drift: random_range(-0.2, 0.2),
        alpha: random_range(0.15, 0.4)
    });
}

// --------------------------------------------
// CREATE SPARKLES
// --------------------------------------------
for (var i = 0; i < sparkle_count; i++) {
    array_push(sparkles, {
        x: random(room_w),
        y: random(room_h),
        size: random_range(1, 3),
        phase: random(360),
        speed: random_range(1, 3),
        alpha: random_range(0.2, 0.9)
    });
}


// --------------------------------------------
// CREATE LARGE, DISTANT BUBBLES
// --------------------------------------------

large_bubble_count = 50;
large_bubbles = [];

for (var i = 0; i < large_bubble_count; i++) {
    array_push(large_bubbles, {
        x: random(room_width),
        y: random(room_height),
        radius: random_range(7, 15),
        speed: random_range(0.1, 0.3),
        drift: random_range(-0.1, 0.1),
        alpha: random_range(0.06, 0.16)
    });
}


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


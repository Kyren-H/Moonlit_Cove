
// --------------------------------------------
// TURTLE — CREATE EVENT
// Dialogue pages
// --------------------------------------------

speaker_name = "Old Turtle";

interaction_range = 50;
dialogue_active = false;
player_near = false;
dialogue_page = 0;

// Each string is one page of dialogue
dialogue_pages = [
    "Hello, little traveler! Welcome to Moonlit Cove.",
    "The moonlight has been strange tonight. The ocean seems to be hiding something.",
    "If you explore carefully, you may discover magical things that only appear before midnight.",
    "Be careful, little one. When midnight comes, the cove begins its cycle anew."
];

// --------------------------------------------
// DIALOGUE SPARKLES
// --------------------------------------------

dialogue_sparkles = [];

for (var i = 0; i < 18; i++) {
    array_push(dialogue_sparkles, {
        x: random(1000),
        y: random(175),
        size: random_range(1.5, 3),
        phase: random(360),
        speed: random_range(1, 3)
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

// Lighting Radius 
event_inherited();
radius = 110;	      // Size of Glow
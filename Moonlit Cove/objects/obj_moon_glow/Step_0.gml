
// ================================================
// MOONLIT COVE — COLLECTIBLE EFFECTS
// Step Event
// ================================================

// Animate the glow
glow_phase += 3;

glow_size = 1 + 0.12 * sin(degtorad(glow_phase));
glow_alpha = 0.25 + 0.15 * sin(degtorad(glow_phase));

// Gentle floating movement
float_phase += 2;
//image_yscale = 1; What's the purpose of this? Messed with the scaling of the image ingame. - CTD
y_offset = sin(degtorad(float_phase)) * 3;

// Create a sparkle periodically
sparkle_timer--;

if (sparkle_timer <= 0) {
    var s = {
        x: random_range(-14, 14),
        y: random_range(-14, 14),
        life: irandom_range(15, 30),
        max_life: 30,
        size: random_range(1.5, 3)
    };

    array_push(sparkle_list, s);

    sparkle_timer = irandom_range(8, 18);
}

// Update existing sparkles
for (var i = array_length(sparkle_list) - 1; i >= 0; i--) {
    var s = sparkle_list[i];

    s.x += random_range(-0.3, 0.3);
    s.y -= 0.4;
    s.life--;

    if (s.life <= 0) {
        array_delete(sparkle_list, i, 1);
    } else {
        sparkle_list[i] = s;
    }
}

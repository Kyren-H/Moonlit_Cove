
/// obj_ocean_particles — Step Event

// --------------------------------------------
// ANIMATE BUBBLES
// --------------------------------------------
for (var i = 0; i < array_length(bubbles); i++) {
    var b = bubbles[i];

    // Slowly rise
    b.y -= b.speed;

    // Gentle horizontal drift
    b.x += b.drift + sin((b.y + i * 10) * 0.02) * 0.15;

    // Reappear at bottom when leaving the top
    if (b.y < -10) {
        b.y = room_height + 10;
        b.x = random(room_width);
    }

    // Wrap around horizontal edges
    if (b.x < -10) b.x = room_width + 10;
    if (b.x > room_width + 10) b.x = -10;

    bubbles[i] = b;
}

// --------------------------------------------
// ANIMATE SPARKLES
// --------------------------------------------
for (var i = 0; i < array_length(sparkles); i++) {
    var s = sparkles[i];

    s.phase += s.speed;

    // Gentle twinkling
    s.alpha = 0.15 + 0.75 *
        (0.5 + 0.5 * sin(degtorad(s.phase)));

    sparkles[i] = s;
}


// --------------------------------------------
// ANIMATE LARGE BUBBLES
// --------------------------------------------

for (var i = 0; i < array_length(large_bubbles); i++) {
    var b = large_bubbles[i];

    // Very slow upward movement
    b.y -= b.speed;

    // Gentle drifting
    b.x += b.drift + sin((b.y + i * 20) * 0.01) * 0.1;

    // Reappear at the bottom
    if (b.y < -b.radius * 2) {
        b.y = room_height + b.radius;
        b.x = random(room_width);
    }

    // Wrap horizontally
    if (b.x < -b.radius) {
        b.x = room_width + b.radius;
    }

    if (b.x > room_width + b.radius) {
        b.x = -b.radius;
    }

    large_bubbles[i] = b;
}



/// obj_ocean_particles — Draw Event

// --------------------------------------------
// DRAW BUBBLES
// --------------------------------------------
draw_set_colour(col_aqua);

for (var i = 0; i < array_length(bubbles); i++) {
    var b = bubbles[i];

    draw_set_alpha(b.alpha);

    // Bubble outline
    draw_circle(
        b.x,
        b.y,
        b.radius,
        true
    );

    // Tiny highlight inside bubble
    draw_set_alpha(b.alpha * 0.6);

    draw_circle(
        b.x - b.radius * 0.3,
        b.y - b.radius * 0.3,
        max(1, b.radius * 0.2),
        false
    );
}

// --------------------------------------------
// DRAW TWINKLING SPARKLES
// --------------------------------------------
draw_set_colour(col_mint);

for (var i = 0; i < array_length(sparkles); i++) {
    var s = sparkles[i];

    draw_set_alpha(s.alpha);

    // Horizontal sparkle line
    draw_line(
        s.x - s.size,
        s.y,
        s.x + s.size,
        s.y
    );

    // Vertical sparkle line
    draw_line(
        s.x,
        s.y - s.size,
        s.x,
        s.y + s.size
    );
}

// Reset drawing settings
draw_set_alpha(1);
draw_set_colour(c_white);

// --------------------------------------------
// DRAW LARGE, DISTANT BUBBLES
// --------------------------------------------

draw_set_colour(col_blue);

for (var i = 0; i < array_length(large_bubbles); i++) {
    var b = large_bubbles[i];

    draw_set_alpha(b.alpha);

    // Large translucent outline
    draw_circle(
        b.x,
        b.y,
        b.radius,
        true
    );

    // Soft inner highlight
    draw_set_alpha(b.alpha * 0.7);

    draw_circle(
        b.x - b.radius * 0.25,
        b.y - b.radius * 0.25,
        max(1, b.radius * 0.12),
        false
    );
}


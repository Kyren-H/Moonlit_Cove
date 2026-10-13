
// --------------------------------------------
// TURTLE — DRAW GUI EVENT
// Wide multi-page dialogue box
// --------------------------------------------

if (dialogue_active) {

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Wider dialogue box
    var box_w = min(1100, gui_w - 48);
    var box_h = 190;

    var box_x = (gui_w - box_w) * 0.5;
    var box_y = gui_h - box_h - 28;

    var text_pad = 32;

    // ----------------------------------------
    // BACKGROUND
    // ----------------------------------------

    draw_set_alpha(0.96);
    draw_set_colour(col_deep);

    draw_roundrect(
        box_x, box_y,
        box_x + box_w, box_y + box_h,
        false
    );

    // Outer border
    draw_set_alpha(1);
    draw_set_colour(col_glow);

    draw_roundrect(
        box_x, box_y,
        box_x + box_w, box_y + box_h,
        true
    );

    // Inner border
    draw_set_colour(col_ocean);

    draw_roundrect(
        box_x + 4, box_y + 4,
        box_x + box_w - 4,
        box_y + box_h - 4,
        true
    );

    // ----------------------------------------
    // TWINKLING BORDER SPARKLES
    // ----------------------------------------

    for (var i = 0; i < array_length(dialogue_sparkles); i++) {
        var s = dialogue_sparkles[i];

        var twinkle = 0.2 + 0.8 *
            (0.5 + 0.5 * sin(degtorad(s.phase)));

        // Keep most sparkles near the upper border
        var sx = box_x + 14
            + (s.x / 1000) * (box_w - 28);

        var sy = box_y + 10
            + (s.y / 175) * 20;

        draw_set_alpha(twinkle);
        draw_set_colour(col_mint);

        // Four-point star
        draw_line(
            sx - s.size * 2, sy,
            sx + s.size * 2, sy
        );

        draw_line(
            sx, sy - s.size * 2,
            sx, sy + s.size * 2
        );

        draw_set_alpha(twinkle * 0.7);
        draw_circle(
            sx, sy,
            max(1, s.size * 0.5),
            false
        );
    }

    // ----------------------------------------
    // SPEAKER NAME
    // ----------------------------------------

    draw_set_alpha(1);
    draw_set_font(fnt_ui);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(col_glow);

    draw_text(
        box_x + text_pad,
        box_y + 22,
        speaker_name
    );

    // Divider
    draw_set_colour(col_blue);

    draw_line(
        box_x + text_pad,
        box_y + 51,
        box_x + box_w - text_pad,
        box_y + 51
    );

    // ----------------------------------------
    // CURRENT DIALOGUE PAGE
    // ----------------------------------------

	draw_set_font(fnt_ui);
	draw_set_colour(col_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var dialogue_x = box_x + text_pad;
	var dialogue_y = box_y + 67;
	var dialogue_w = box_w - text_pad * 2;

	// Explicit line spacing to prevent overlapping
	var line_spacing = 32;

	draw_text_ext(
	    dialogue_x,
	    dialogue_y,
	    dialogue_pages[dialogue_page],
	    line_spacing,
	    dialogue_w
	);

    // ----------------------------------------
    // PAGE COUNTER
    // ----------------------------------------

    draw_set_font(fnt_ui);
    draw_set_halign(fa_right);
    draw_set_colour(col_aqua);

    draw_text(
        box_x + box_w - text_pad,
        box_y + box_h - 30,
        string(dialogue_page + 1)
        + " / "
        + string(array_length(dialogue_pages))
    );

    // ----------------------------------------
    // CONTINUE PROMPT
    // ----------------------------------------

    draw_set_halign(fa_center);
    draw_set_colour(col_moon);

    var prompt = "CLICK / SPACE  >";

    if (dialogue_page == array_length(dialogue_pages) - 1) {
        prompt = "CLICK / SPACE  TO CLOSE";
    }

    draw_text(
        box_x + box_w * 0.5,
        box_y + box_h - 30,
        prompt
    );

    // ----------------------------------------
    // RESET DRAW SETTINGS
    // ----------------------------------------

    draw_set_alpha(1);
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}

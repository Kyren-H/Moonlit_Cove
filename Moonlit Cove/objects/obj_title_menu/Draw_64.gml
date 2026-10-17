
// ================================================
// MOONLIT COVE — DRAW GUI EVENT
// Target GUI: 1920 x 1080
// ================================================

var sw = display_get_gui_width();
var sh = display_get_gui_height();

// -- Time For Motion
var t = current_time/1000;

draw_set_alpha(1);
draw_set_colour(col_bg);
draw_rectangle(0, 0, sw, sh, false);

// ------------------------------------------------
// DISTANT OCEAN
// ------------------------------------------------
draw_set_colour(col_deep);
draw_set_alpha(0.8);
draw_rectangle(0, 560, sw, sh, false);

draw_set_colour(col_ocean);
draw_set_alpha(0.16);
draw_rectangle(0, 820, sw, sh, false);
draw_set_alpha(1);

var wave_top = 572; 
var wave_bot = 840;
var wave_rows = 8;  // Number of rows
var wave_px = 4;

for (var wr = 0; wr < wave_rows; wr++){
	var wave_d = wr / (wave_rows - 1);
	var wave_y = lerp(wave_top, wave_bot, wave_d * wave_d);
	var wave_amp = lerp(1.5, 16, wave_d * wave_d);
	var wave_len = lerp(40, 160, wave_d);
	var wave_spd = lerp(0.35, 1.1, wave_d) * ((wr mod 2 == 0) ? 1: -1);
	var wave_ph = wr * 1.7;

	draw_set_colour(merge_colour(col_deep, col_ocean, 0.15 + wave_d * 0.45))
	draw_set_alpha(lerp(0.25, 0.55, wave_d));
	draw_primitive_begin(pr_trianglestrip);
	for (var wx = 0; wx <= sw; wx += wave_px){
		var wy = wave_y + sin(wx / wave_len + t * wave_spd + wave_ph) * wave_amp
                      + sin(wx / (wave_len * 0.45) - t * wave_spd * 1.6) * wave_amp * 0.35;
        draw_vertex(wx, floor(wy / wave_px) * wave_px);
        draw_vertex(wx, wave_bot);
	}
	draw_primitive_end();
	
	var wave_col = (wave_d < 0.35) ? col_blue : ((wave_d < 0.7) ? col_aqua : col_glow);
	var wave_h = (wave_d < 0.5) ? 2 : wave_px;
	draw_set_colour(wave_col);
	for(var wx = 0; wx <= sw; wx += wave_px){
		var wave_c = sin(wx / wave_len + t * wave_spd + wave_ph);
		if (wave_c < -0.75){
			var wy = wave_y + wave_c * wave_amp + sin(wx / (wave_len * 0.45) - t * wave_spd * 1.6) * wave_amp * 0.35;
			wy = floor(wy / wave_px) * wave_px;
			draw_set_alpha(lerp(0.3, 0.85, wave_d) * (0.6 + 0.4 * sin(t * 2 + wx * 0.03 + wr)));	
			draw_rectangle(wx, wy, wx + wx + wave_px - 1, wy + wave_h - 1, false);
		}
	}
	if (wave_d > 0.5) {
		draw_set_colour(col_moon);
		for(var g = -6; g <= 6; g++) {
			var gx = sw * 0.5 + g * 22 + sin(t * 2 + g) * 6;
			var gy = wave_y + sin(gx / wave_len + t * wave_spd + wave_ph) * wave_amp + wave_px * 2;
			gy = floor(gy / wave_px) * wave_px;
			var gl = (3 + abs(sin(t * 3 + g * 1.3 + wr)) * 8) * wave_amp + wave_px * (1 - abs(g) / 7);
			draw_set_alpha(max(0, 0.7 - abs(g) * 0.1) * wave_d);
			draw_rectangle(gx - gl * 0.5, gy, gx + gl * 0.5, gy + wave_px - 1, false);
		}
	}
}
draw_set_alpha(1);
	
	
// -- Background Star Field [FIXED]	
var star_count =1000;
for(var k = 0; k < star_count; k ++){
	var star_x = (k * 7919 + 131) mod sw;
	var star_y = (k * k * 37 + k * 331 + 47) mod 540;
	var star_s = 1 + (k mod 3);
	
	draw_set_colour((k mod 4 == 0) ? col_glow : col_mint);
	
	draw_set_alpha(0.3 + 0.25 * sin(t * (0.8 + (k mod 5) * 0.3) + k));
	draw_rectangle(star_x, star_y, star_x + star_s, star_y + star_s, false);
}
draw_set_alpha(1);

// ------------------------------------------------
// STARS — KEEP THEM OUTSIDE THE LOGO'S CENTER
// ------------------------------------------------
draw_set_colour(col_mint);

draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(125, 130, 130, 135, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(290, 285, 294, 289, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(365, 440, 369, 444, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(1510, 145, 1515, 150, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(1740, 285, 1744, 289, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(1585, 430, 1589, 434, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(210, 520, 214, 524, false);
draw_set_alpha(0.6 + 0.4 * sin(t * 1.6));
draw_rectangle(1680, 535, 1684, 539, false);

draw_set_alpha(1); 
// ------------------------------------------------
// PROMINENT FOUR-POINT DIAMOND STARS
// ------------------------------------------------

// Left diamond
var dx = 245;
var dy = 365;
var ds = 13;

draw_set_colour(col_moon);
draw_triangle(dx, dy - ds,
              dx + ds * 0.55, dy,
              dx, dy + ds, false);
draw_triangle(dx, dy - ds,
              dx - ds * 0.55, dy,
              dx, dy + ds, false);

// Right diamond
dx = 1650;
dy = 385;
ds = 15 * (1 + 0.15 * sin(t * 2.0 + 1.5));

draw_set_colour(col_mint);
draw_triangle(dx, dy - ds,
              dx + ds * 0.55, dy,
              dx, dy + ds, false);
draw_triangle(dx, dy - ds,
              dx - ds * 0.55, dy,
              dx, dy + ds, false);

// Tiny cyan sparkle
dx = 1720;
dy = 490;
ds = 7 * (1 + 0.15 * sin(t * 2.0 + 1.5));

draw_set_colour(col_glow);
draw_triangle(dx, dy - ds,
              dx + ds * 0.55, dy,
              dx, dy + ds, false);
draw_triangle(dx, dy - ds,
              dx - ds * 0.55, dy,
              dx, dy + ds, false);
// -------------------------------------
//	SHOOTING STARS
// -------------------------------------
var shooting_count = 50; 
for (var m = 0; m < shooting_count; m++){
	var ss_period = 6 + m * 3.5;
	var ss_dur = 1.1;
	var ss_time = t + m * 2.7;
	var ss_phase = ss_time mod ss_period;
	
	if(ss_phase < ss_dur){
		var ss_dist = 520;
		var ss_cycle = floor(ss_time / ss_period)
		var ss_p = ss_phase / ss_dur;
		
		var ss_x = 300 + ((ss_cycle * 613 + m * 977) mod (sw - 400));
		var ss_y = 40 + ((ss_cycle * 271 + m * m * 149) mod 220);
		var ss_hx = ss_x - ss_dist * ss_p;
		var ss_hy = ss_y + ss_dist * 0.45 * ss_p;
		var ss_fade = sin(ss_p * pi);
		var ss_len = 150;
		
		draw_set_colour(col_moon);
		for (var seg = 0; seg < 10; seg++){
			var seg_a = seg / 10;
			var seg_b = (seg + 1) /10;
			
			draw_set_alpha(ss_fade * (1 - seg_a) * 0.85);
			draw_line_width(
                ss_hx + ss_len * seg_a, ss_hy - ss_len * 0.45 * seg_a,
                ss_hx + ss_len * seg_b, ss_hy - ss_len * 0.45 * seg_b,
                1 + 3 * (1 - seg_a)
            );
		}
		draw_set_alpha(ss_fade);
		draw_circle(ss_hx, ss_hy, 3, false);
	}
}
draw_set_alpha(1)

// ------------------------------------------------
// VISIBLE PIXEL-STYLE WAVES
// Drawn BELOW the final button, not behind it.
// ------------------------------------------------
var wave_y = 905;
// -- Moving Effects -- 
var far_shift = sin(t * 0.8) * 18;
var near_shift = -sin(t * 1.1) * 26;
var near_y = wave_y + sin(t * 1.4) * 2;

// Far wave
draw_set_colour(col_blue);
draw_set_alpha(0.85);

draw_rectangle(-40 + far_shift, wave_y + 8, 190 + far_shift, wave_y + 12, false);
draw_rectangle(19 + far_shift, wave_y + 12, 320 + far_shift, wave_y + 16, false);
draw_rectangle(320 + far_shift, wave_y + 8, 475 + far_shift, wave_y + 12, false);

draw_rectangle(1445 + far_shift, wave_y + 10, 1580 + far_shift, wave_y + 14, false);
draw_rectangle(1580 + far_shift, wave_y + 5, 1740 + far_shift, wave_y + 9, false);
draw_rectangle(1740 + far_shift, wave_y + 9, sw + 40, wave_y + 13, false);

// Near wave
draw_set_colour(col_aqua);
draw_set_alpha(0.95);

draw_rectangle(80 + near_shift, near_y + 42, 220 + near_shift, near_y + 46, false);
draw_rectangle(220 + near_shift, near_y + 38, 360 + near_shift, near_y + 42, false);
draw_rectangle(360 + near_shift, near_y + 42, 490 + near_shift, near_y + 46, false);

draw_rectangle(1320 + near_shift, near_y + 42, 1460 + near_shift, near_y + 46, false);
draw_rectangle(1460 + near_shift, near_y + 36, 1610 + near_shift, near_y + 40, false);
draw_rectangle(1610 + near_shift, near_y + 42, 1770 + near_shift, near_y + 46, false);

// Small wave highlights
draw_set_colour(col_glow);
draw_set_alpha(0.5 + 0.5 * sin(t * 2.2))
draw_rectangle(130 + near_shift, near_y + 34, 190 + near_shift, near_y + 37, false);
draw_rectangle(395 + near_shift, near_y + 55, 455 + near_shift, near_y + 58, false);
draw_set_alpha(0.5 + 0.5 * sin(t * 2.2 + 2.0))
draw_rectangle(1480 + near_shift, near_y + 28, 1540, near_y + 31, false);
draw_rectangle(1680 + near_shift, near_y + 56, 1740, near_y + 59, false);

draw_set_alpha(1);

// ------------------------------------------------
// TITLE LOGO
// Logo sprite origin should be TOP LEFT.
// The logo ends above the buttons.
// ------------------------------------------------
var logo_max_w = 1745;
var logo_max_h = 982;

var logo_scale = min(
    logo_max_w / sprite_get_width(spr_title_logo),
    logo_max_h / sprite_get_height(spr_title_logo)
);

var logo_w = sprite_get_width(spr_title_logo) * logo_scale;
var logo_h = sprite_get_height(spr_title_logo) * logo_scale;

var logo_x = (sw - logo_w) * 0.5;
var logo_y = -70 + sin(t * 1.2) * 6;
draw_sprite_ext(
    spr_filter1, 0,
    0, 0,
	1920, 1080,
    0, c_white, 1
);

draw_sprite_ext(
    spr_title_logo, 0,
    logo_x, logo_y,
    logo_scale, logo_scale,
    0, c_white, 1
);

 // ------------------------------------------------
 // HORIZONTAL MENU BUTTONS — SOFT BUBBLE STYLE
 // ------------------------------------------------
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(buttons); i++) {
	
    var bx1 = btn_left(i);
    var by1 = btn_y;
    var bx2 = bx1 + btn_width;
    var by2 = by1 + btn_height;

    var is_selected = (i == selected);
    var is_hovered = (i == hover);
    var active = is_selected || is_hovered;
	var bob = sin(t * 2.0 + i * 0.9) * 3 - (active ? 3 : 0);

    var cy = (by1 + by2) * 0.5;

    // Increase this for a more pill-shaped button.
    // For a full pill, radius should be half the height.
    var radius = btn_height * 0.5;

    // ------------------------------------------------
    // OUTER SOFT GLOW
    // ------------------------------------------------
    if (active) {
		var breathe = 0.5 + 0.5 * sin(t * 3.0);
        draw_set_alpha(0.05 + 0.5 * sin(t * 3.0));
        draw_set_colour(col_glow);
        draw_roundrect(
            bx1 - 12, by1 - 10,
            bx2 + 12, by2 + 10,
            false
        );

        draw_set_alpha(0.10 + 0.08 * breathe);
        draw_roundrect(
            bx1 - 6, by1 - 5,
            bx2 + 6, by2 + 5,
            false
        );
    }

    // ------------------------------------------------
    // BUTTON BODY
    // ------------------------------------------------
    draw_set_alpha(1);
    draw_set_colour(active ? col_ocean : col_deep);
    draw_roundrect(
        bx1, by1, bx2, by2, false
    );

    // ------------------------------------------------
    // INNER TOP HIGHLIGHT
    // A thin accent gives the button a glossy feel.
    // ------------------------------------------------
    draw_set_alpha(active ? 0.55 : 0.22);
    draw_set_colour(active ? col_moon : col_aqua);
    draw_roundrect(
        bx1 + radius * 0.35,
        by1 + 3,
        bx2 - radius * 0.35,
        by1 + 6,
        false
    );

    // ------------------------------------------------
    // OUTLINE
    // ------------------------------------------------
    draw_set_alpha(1);
    draw_set_colour(active ? col_mint : col_blue);
    draw_roundrect(
        bx1, by1, bx2, by2, true
    );

    // ------------------------------------------------
    // LEFT DIAMOND ACCENT
    // ------------------------------------------------
    var dx = bx1 + 27;
    var dy = cy;
    var r = active ? 8 + sin(t * 4.0) * 1.5 : 6;
    draw_set_colour(active ? col_moon : col_aqua);

    draw_triangle(
        dx, dy - r,
        dx + r * 0.65, dy,
        dx, dy + r,
        false
    );

    draw_triangle(
        dx, dy - r,
        dx - r * 0.65, dy,
        dx, dy + r,
        false
    );

    // ------------------------------------------------
    // BUTTON TEXT
    // ------------------------------------------------
    draw_set_colour(col_text);

    draw_text(
        (bx1 + bx2) * 0.5 + 8,
        cy,
        buttons[i]
    );
}

draw_set_alpha(1);

// ------------------------------------------------
// FOOTER
// ------------------------------------------------
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(col_aqua);
draw_set_alpha(0.7 + 0.3 * sin(t * 1.8));
draw_text(sw * 0.5, 940 + sin( t * 1.5 + 1.0) *4, "A LITTLE OCEAN FULL OF SECRETS");


 // ------------------------------------------------
 // MOONLIT COVE — MOONLIT GLASS PANELS
 // Responsive panel sizing + starry ocean theme
 // ------------------------------------------------
if (panel != "none") {

    // --------------------------------------------
    // PREPARE TEXT
    // --------------------------------------------
    var is_how = (panel == "how");
    var is_credits = (panel == "credits" || panel == "Credits");

    var heading = is_how ? "How to Play" : "Credits";
    var subheading = is_how
        ? "YOUR JOURNEY BEGINS BENEATH THE MOON"
        : "THE STARS BEHIND THE STORY";

    var body = "";
    var body_w = 800;
    var pad = 64;

    if (is_how) {
        body =
            "Welcome to Moonlit Cove\n\n"
            + "You are Tsuki, a baby orca born from the moon's "
            + "reflection. The reflection has disappeared, and "
            + "the night keeps repeating.\n\n"
            + "HOW TO EXPLORE\n"
            + "MOVE: W, A, S, D or Arrow Keys\n"
            + "DASH / SPIN: Space\n"
            + "INTERACT: E\n\n"
            + "Explore the cove, discover hidden paths, and learn "
            + "the rhythm of the ocean. The world resets at "
            + "midnight, but your discoveries help you progress.";
    }

    // --------------------------------------------
    // MEASURE CONTENT
    // --------------------------------------------
    draw_set_font(fnt_ui);

    // More breathing room between lines
	var line_sep = string_height("M") * 0.8;
    var body_h = 0;

    if (is_how) {
        body_h = string_height_ext(body, line_sep, body_w);
    } else {
        body_h = string_height("M") * 2.5
            + array_length(credits) * string_height("M") * 2.5;
    }

    // Leave room for title, subtitle, divider and footer.
    var pw = 1040;
    var min_ph = 560;
    var max_ph = sh - 100;
    var ph = max(min_ph, body_h + 300);
    ph = min(ph, max_ph);

    // Keep the panel inside the screen.
    pw = min(pw, sw - 80);

    var px = (sw - pw) * 0.5;
    var py = (sh - ph) * 0.5;

    // --------------------------------------------
    // DIM THE WORLD BEHIND THE PANEL
    // --------------------------------------------
    draw_set_alpha(0.78);
    draw_set_colour(col_bg);
    draw_rectangle(0, 0, sw, sh, false);

    // --------------------------------------------
    // DISTANT MOONLIGHT HALO
    // --------------------------------------------
    draw_set_alpha(0.07);
    draw_set_colour(col_glow);
    draw_circle(sw * 0.5, py + 10, pw * 0.48, false);

    // --------------------------------------------
    // OUTER GLOW
    // --------------------------------------------
    draw_set_alpha(0.08);
    draw_set_colour(col_glow);
    draw_roundrect(
        px - 12, py - 12,
        px + pw + 12, py + ph + 12,
        false
    );

    draw_set_alpha(0.14);
    draw_set_colour(col_aqua);
    draw_roundrect(
        px - 5, py - 5,
        px + pw + 5, py + ph + 5,
        false
    );

    // --------------------------------------------
    // PANEL BODY
    // --------------------------------------------
    draw_set_alpha(0.97);
    draw_set_colour(col_deep);
    draw_roundrect(px, py, px + pw, py + ph, false);

    // Inner inset border
    draw_set_alpha(1);
    draw_set_colour(col_ocean);
    draw_roundrect(
        px + 9, py + 9,
        px + pw - 9, py + ph - 9,
        true
    );

    // Outer moonlit outline
    draw_set_colour(col_glow);
    draw_roundrect(px, py, px + pw, py + ph, true);

    // --------------------------------------------
    // CORNER STARS
    // --------------------------------------------
    draw_set_colour(col_mint);

    // Upper left sparkle
    var sx = px + 35;
    var sy = py + 42;
    var ss = 8;

    draw_triangle(
        sx, sy - ss,
        sx + 4, sy,
        sx, sy + ss,
        false
    );
    draw_triangle(
        sx, sy - ss,
        sx - 4, sy,
        sx, sy + ss,
        false
    );

    // Upper right sparkle
    sx = px + pw - 35;
    sy = py + 42;

    draw_triangle(
        sx, sy - ss,
        sx + 4, sy,
        sx, sy + ss,
        false
    );
    draw_triangle(
        sx, sy - ss,
        sx - 4, sy,
        sx, sy + ss,
        false
    );

    // Small stars
    draw_set_colour(col_aqua);
    draw_rectangle(px + 52, py + 72, px + 57, py + 77, false);
    draw_rectangle(px + pw - 57, py + 72, px + pw - 52, py + 77, false);

    // --------------------------------------------
    // CRESCENT MOON
    // --------------------------------------------
    var moon_x = sw * 0.5;
    var moon_y = py + 53;

    draw_set_alpha(1);
    draw_set_colour(col_moon);
    draw_circle(moon_x, moon_y, 19, false);

    // Mask part of the moon to create a crescent.
    draw_set_colour(col_deep);
    draw_circle(moon_x + 9, moon_y - 6, 17, false);

    // Tiny orbiting star
    draw_set_colour(col_glow);
    draw_triangle(
        moon_x + 28, moon_y - 20,
        moon_x + 32, moon_y - 13,
        moon_x + 28, moon_y - 6,
        false
    );
    draw_triangle(
        moon_x + 28, moon_y - 20,
        moon_x + 24, moon_y - 13,
        moon_x + 28, moon_y - 6,
        false
    );

    // --------------------------------------------
    // TITLE
    // --------------------------------------------
    draw_set_font(fnt_header);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_colour(col_moon);
    draw_text(sw * 0.5, py + 105, heading);

    // Subtitle
    draw_set_font(fnt_ui);
    draw_set_colour(col_aqua);
    draw_text(sw * 0.5, py + 150, subheading);

    // --------------------------------------------
    // WAVY DIVIDER
    // --------------------------------------------
    var div_y = py + 185;
    var div_x1 = px + pad;
    var div_x2 = px + pw - pad;

    draw_set_colour(col_blue);
    draw_set_alpha(0.85);
    draw_line(div_x1, div_y, div_x2, div_y);

    // Moonlit glint in the middle
    draw_set_colour(col_glow);
    draw_set_alpha(1);
    draw_line(
        sw * 0.5 - 45, div_y,
        sw * 0.5 + 45, div_y
    );

    // --------------------------------------------
    // CONTENT
    // --------------------------------------------
    var content_y = py + 215;
    var content_x = px + pad;

    draw_set_font(fnt_ui);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    if (is_how) {

        // Draw the text in one measured block.
        // Its width matches the available panel space.
        draw_set_colour(col_text);

        draw_text_ext(
            content_x, content_y,
            body,
            line_sep,
            body_w
        );

    } else if (is_credits) {

        // Introductory credit
        draw_set_halign(fa_center);
        draw_set_colour(col_mint);
        draw_text(sw * 0.5, content_y, "Moonlit Cove");

        draw_set_colour(col_text);
        draw_text(
            sw * 0.5,
            content_y + string_height("M") * 1.8,
            "Created by Underground Metro"
        );

        // Contributor rows
        draw_set_halign(fa_left);

        var row_start = content_y + string_height("M") * 4;
        var row_gap = string_height("M") * 2.6;
        var label_x = px + pad + 55;
        var name_x = px + pw * 0.53;

        for (var j = 0; j < array_length(credits); j++) {

            var row_y = row_start + j * row_gap;

            // Soft star marker
            draw_set_colour(col_glow);
            draw_circle(label_x - 20, row_y + 9, 4, false);

            // Role
            draw_set_colour(col_aqua);
            draw_text(label_x, row_y, credits[j][0]);

            // Name
            draw_set_colour(col_text);
            draw_text(name_x, row_y, credits[j][1]);
        }
    }

    // --------------------------------------------
    // FOOTER DIVIDER + CLOSE INSTRUCTION
    // --------------------------------------------
    var footer_y = py + ph - 72;

    draw_set_alpha(0.75);
    draw_set_colour(col_blue);
    draw_line(
        px + pad, footer_y,
        px + pw - pad, footer_y
    );

    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(col_glow);

    draw_text(
        sw * 0.5,
        py + ph - 40,
        "Press Enter, Escape, or click to close"
    );

    // --------------------------------------------
    // RESTORE DRAWING STATE
    // --------------------------------------------
    draw_set_alpha(1);
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// ------------------------------------------------
// FADE TO GAME
// ------------------------------------------------
if (fade > 0) {
    draw_set_alpha(fade);
    draw_set_colour(col_bg);
    draw_rectangle(0, 0, sw, sh, false);
}

// Restore drawing state
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);

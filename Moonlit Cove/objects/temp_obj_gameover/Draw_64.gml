var sw = display_get_gui_width()
var sh = display_get_gui_height()
var t = current_time/1000;

draw_set_alpha(1);
draw_set_colour(col_bg);
draw_rectangle(0, 0, sw, sh, false);

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
// DISTANT OCEAN
// ------------------------------------------------
draw_set_colour(col_deep);
draw_set_alpha(0.8);
draw_rectangle(0, 740, sw, sh, false);

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

// ------------------------------------------------
// Title Logo
// ------------------------------------------------
var spr = has_won ? spr_win : spr_game_over;
var logo_max_w = 900;
var logo_max_h = 560;

var logo_scale = min(
    logo_max_w / sprite_get_width(spr),
    logo_max_h / sprite_get_height(spr)
);

var logo_w = sprite_get_width(spr) * logo_scale;
var logo_h = sprite_get_height(spr) * logo_scale;
var sub_y = 520;
var logo_x = (sw - logo_w) * 0.5;
var logo_y = 40 + sin(t * 1.2) * 6;
draw_sprite_ext(spr, 0, logo_x, logo_y, logo_scale, logo_scale, 0, c_white, 1);

 // -- Message -- 
 draw_set_font(fnt_ui);
 draw_set_halign(fa_center);
 draw_set_valign(fa_middle);
 draw_set_colour(col_aqua);
 draw_text(sw * 0.5, sub_y,
	has_won ? "The moon's reflection shines on Moonlit Cove again."
			: "The nights slipped away .... but the cove remembers you.");
 
 // ------------------------------------------------
 // SHOWS WHAT ITEMS THE PLAYER HAS COLLECTED
 // ------------------------------------------------
 draw_set_colour(col_mint);
 draw_text(sw * 0.5, 568, "Collected this run: " + string(item_count) + " / 3");
 for (var n = 0; n < 3; n++){
	var icon_x = sw * 0.5 + (n - 1) * item_gap;
	var icon_y = item_row_y + sin(t * 2 + n) * 4;
	var spr_icon = item_sprites[n];
	var scale = item_size / sprite_get_width(spr_icon);
	
	if (item_have[n]) {
		gpu_set_blendmode(bm_add);
		draw_set_colour(col_glow);
		draw_set_alpha(0.18 + 0.08 * sin(t * 3 + n));
		draw_circle(icon_x, icon_y, item_size * 0.7, false);
		gpu_set_blendmode(bm_normal);
		
		draw_sprite_ext(spr_icon, 0, icon_x, icon_y, scale, scale, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_icon, 0, icon_x, icon_y, scale, scale, 0, col_blue, 0.7);
	}
 }
 draw_set_alpha(1);
 draw_set_colour(c_white);
 
 // ------------------------------------------------
 // HORIZONTAL MENU BUTTONS — SOFT BUBBLE STYLE
 // ------------------------------------------------
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(buttons); i++) {

    var is_selected = (i == selected);
    var is_hovered = (i == hover);
    var active = is_selected || is_hovered;
	var bob = sin(t * 2.0 + i * 0.9) * 3 - (active ? 3 : 0);
	
	var bx1 = btn_left(i);
    var by1 = btn_y + bob;
    var bx2 = bx1 + btn_width;
    var by2 = by1 + btn_height;
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
            bx1 - 10, 
			by1 -8,
            bx2 + 10, 
			by2 + 8,
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

// -- Footer -- 
draw_set_colour(col_aqua);
draw_set_alpha(0.55 + 0.25 * sin(t * 1.8));
draw_text(sw * 0.5, btn_y + btn_height + 40, "Enter or click to choose   |   R to try again");

// -- Restore Draw State -- 
draw_set_alpha(1);
draw_set_colour(c_white); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
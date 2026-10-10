// -- Background --
draw_set_colour(col_bg);
draw_rectangle(0, 0, get_width, get_height, false);

// -- Title --
draw_set_font(fnt_title);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_colour(col_glow);
draw_bobbing_text("Moonlit Cove", get_width / 2 + 3, get_height * 0.3 +3, 1,0);
draw_set_colour(col_text);
draw_bobbing_text("Moonlit Cove", get_width / 2, get_height * 0.3, 1 ,0);


// -- Button Design--
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
for(var i = 0; i < array_length(buttons); i ++){
	var t1 = btn_top(i);
	var on = (i == selected);
	draw_set_colour(on ? col_hover : col_btn);
	draw_rectangle(btn_x, t1, btn_x + btn_width, t1 + btn_height, false);
	draw_set_colour(on ? col_text : col_glow);
	draw_rectangle(btn_x, t1, btn_x + btn_width, t1 + btn_height, true);
	draw_set_colour(col_text);
	draw_text(get_width / 2, t1 + btn_height / 2, buttons[i]);
}

// -- Panels -- 
if (panel != "none"){
	// -- Overall Design --
	// --  Pixel Size for Box [Variables] --
	var pixel_w = min(840, get_width - 80);
	var pixel_h = min(540, get_height - 80);
	var px = get_width / 2 - pixel_w / 2;
	var py = get_height / 2 - pixel_h /2;
	var pad = 48;
	// -- Box and Box Background --
	draw_set_alpha(0.75);
	draw_set_colour(c_black)
	draw_rectangle(0, 0, get_width, get_height, false);
	draw_set_alpha(1);
	draw_set_colour(col_bg);
	draw_rectangle(px, py, px + pixel_w, py + pixel_h, false);
	draw_set_colour(col_glow);
	draw_rectangle(px, py, px + pixel_w, py + pixel_h, true);
	
	// -- Header Style --
	var heading = (panel == "how") ? "How To Play" : "Credits";
	draw_set_font(fnt_header); 
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour(col_text);
	draw_text(get_width / 2, py + 32, heading);
	
	// -- Body Style And Placement --
	var body_y = py + 32 + string_height(heading) + 24; 
	draw_set_font(fnt_ui);
	var line_height = string_height("M") * 1.3;
	draw_set_halign(fa_left);
	

	// -- The How To Play Section --
	if(panel == "how"){
		draw_text_ext(px + pad, body_y,
			"You are Tsuki, A baby orca born from the moon's reflection. " +
			"The reflection is missing and the night keeps repeating.\n\n" +
			"Move: W, A, S, D or Arrow Keys\n"+
			"Spin: Space\n" +
			"Each loop resets the world, but Tsuki remembers what you learned",
			line_height, pixel_w - pad * 2
		);
	}
	
	// -- Credit Section -- 
	if(panel == "Credits"){
		draw_set_colour(col_glow);
		draw_set_halign(fa_center);
		draw_text(get_width / 2, body_y, "Moonlit Cove, by Underground Metro");
		draw_set_halign(fa_left);
		var name_x = px + pixel_w * 0.55;
		for(var i = 0; i < array_length(credits); i++){
			var row_y = body_y + line_height * 1.6 + i * line_height * 1.3;
			draw_set_colour(col_glow);
			draw_text(px + pad, row_y, credits[i][0]);
			draw_set_colour(col_text);
			draw_text(name_x, row_y, credits[i][1]);
		}
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(col_glow);
	draw_text(get_width / 2, py + pixel_h - 40, "Press Enter or Click to close");
}

// -- Fading into the game --
if(fade > 0){
	draw_set_alpha(fade);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, get_width, get_height, false);
}


// -- Reset State --
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
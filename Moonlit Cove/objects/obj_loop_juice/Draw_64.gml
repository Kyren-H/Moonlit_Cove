var juice_alpha = 0;

if (progress < 0.8) {
	juice_alpha = (progress / 0.8);
} else {
	juice_alpha = 1 - ((progress - 0.8) / 0.2);
}

// Construct the white rectangle.
draw_set_alpha(juice_alpha);
draw_set_color(c_white);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(), false)

// Reset alpha for draw safety.
draw_set_alpha(1);
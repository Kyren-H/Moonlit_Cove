var juice_alpha = 0;

juice_alpha = progress;

// Construct the white rectangle.
draw_set_alpha(juice_alpha);
draw_set_color(c_white);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(), false)

// Reset alpha for draw safety.
draw_set_alpha(1);
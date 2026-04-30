// change color on hovering
draw_set_color(hovering ? c_ltgray : c_white);

// draw background button
draw_rectangle(x, y, x+width, y + height, false);

// draw button border
draw_set_colour(c_black);
draw_rectangle(x, y, x+width, y+height, true);

//draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width/2, y+ height/2, text);

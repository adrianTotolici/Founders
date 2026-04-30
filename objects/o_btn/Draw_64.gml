draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, rot, c_white, trans);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (variable_instance_exists(id, "text_color")) {
	draw_set_color(text_color ?? c_white);
} else {
	draw_set_color(c_white);
} 
draw_text(x, y, button_text);
if (variable_instance_exists(id, "text_color")) {
    draw_set_color(text_color ?? c_white);
} else {
    draw_set_color(c_white);
}

draw_text_transformed(x, y, text_content , x_scale, y_scale, text_rotation);
// reset gui
draw_set_color(c_white); 
draw_set_alpha(1.0);
// -------------------------------------------------------------------------------------- Menu Button
var alpha = menu_btn_hover ? 0.7 : 1.0;

draw_sprite_ext(
    spr_btn, 0,
    menu_btn_x, menu_btn_y,
    ui_x_scale, ui_y_scale,
    0, c_white, alpha
);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text(menu_btn_x, menu_btn_y, menu_btn_text);

draw_set_colour(c_white);


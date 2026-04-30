// menu button
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

menu_btn_hover = point_in_rectangle(_mx, _my,
	menu_btn_x - menu_btn_w / 2,
	menu_btn_y - menu_btn_h / 2,
	menu_btn_x + menu_btn_w / 2,
	menu_btn_y + menu_btn_h / 2
);

if (menu_btn_hover && mouse_check_button_pressed(mb_left)) {
	room_goto(rm_menu);
}
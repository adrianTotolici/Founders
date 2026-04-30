var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

hovering = point_in_rectangle(_mouse_x, _mouse_y, x, y, x + width, y + height);

if (hovering && mouse_check_button_pressed(mb_left)) {
	room_goto(rm_menu);
}
var _cam_x = camera_get_view_x(cam);
var _cam_y = camera_get_view_y(cam);

if (mouse_check_button_pressed(mb_left)) {
	dragging = true;
	mouse_x_start = device_mouse_raw_x(0);
	mouse_y_start = device_mouse_raw_y(0);
}

if (mouse_check_button_released(mb_left)){
	dragging = false;
}

if (dragging) {
	var _move_x = mouse_x_start - device_mouse_raw_x(0);
	var _move_y = mouse_y_start - device_mouse_raw_y(0);
	
	camera_set_view_pos(cam, _cam_x + _move_x, _cam_y + _move_y);
	
	mouse_x_start = device_mouse_raw_x(0);
	mouse_y_start = device_mouse_raw_y(0);
}
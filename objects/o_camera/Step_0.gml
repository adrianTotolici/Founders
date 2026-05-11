var _cam_x = camera_get_view_x(cam);
var _cam_y = camera_get_view_y(cam);
var _ui_blocked = o_game_manager.mouse_on_ui;

if (mouse_check_button_pressed(mb_left) && !_ui_blocked) {
    dragging = true;
    mouse_x_start = device_mouse_raw_x(0);
    mouse_y_start = device_mouse_raw_y(0);
}

if (mouse_check_button_released(mb_left)) {
    dragging = false;
}

// Drag movement
if (dragging && !_ui_blocked) {
    var _move_x = mouse_x_start - device_mouse_raw_x(0);
    var _move_y = mouse_y_start - device_mouse_raw_y(0);

    camera_set_view_pos(cam, _cam_x + _move_x, _cam_y + _move_y);

    mouse_x_start = device_mouse_raw_x(0);
    mouse_y_start = device_mouse_raw_y(0);
}

// --- CAMERA BOUNDARIES ---
var _new_x = camera_get_view_x(cam);
var _new_y = camera_get_view_y(cam);

// Read UI bar heights
var _bottom_bar = o_game_manager.ui_bar_h;
var _top_bar    = o_game_manager.top_bar_h;

// The camera should not show the area hidden behind the UI
var _visible_cam_h = _cam_h - _bottom_bar +_top_bar;

// Compute max camera Y
var _max_y = room_height - _visible_cam_h;

// Clamp so camera never goes above top bar or below bottom bar
_new_x = clamp(_new_x, 0, room_width - _cam_w);
_new_y = clamp(_new_y, _top_bar, _max_y);

camera_set_view_pos(cam, _new_x, _new_y);

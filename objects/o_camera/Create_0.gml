view_enabled = true;
view_set_visible(_view_port, true);

camera_set_view_size(view_camera[_view_port], _cam_w, _cam_h);
view_set_wport(_view_port, _cam_w);
view_set_hport(_view_port, _cam_h);

surface_resize(application_surface, _cam_w, _cam_h);

cam = view_camera[_view_port];
dragging = false;

mouse_x_start = 0;
mouse_y_start = 0;
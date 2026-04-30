var _gui_x = device_mouse_x_to_gui(0);
var _gui_y = device_mouse_y_to_gui(0);

if (position_meeting(x, y, id)) { 
    if (point_in_rectangle(_gui_x, _gui_y, xstart - (sprite_width/2), ystart - (sprite_height/2), xstart + (sprite_width/2), ystart + (sprite_height/2))) {
         if (button_action != -1){
			 button_action();
		 }
    }
}
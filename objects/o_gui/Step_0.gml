var _sel = noone;
with(o_animal) { 
	if (selected) 
		_sel = id;
		break;
}

if (_sel != noone && variable_instance_exists(_sel, "_ui_commands"))
{
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    var cmds = _sel._ui_commands;

    var start_x = info_w + padding;
    var b_y = gui_h - bar_h + padding;

    if (mouse_check_button_pressed(mb_left))
    {
        for (var i = 0; i < array_length(cmds); i++)
        {
			var btn_w = cmds[i]._button_w;
			var btn_h = cmds[i]._button_h;
            var b_x = start_x + i * (btn_w + padding);

            if (point_in_rectangle(_mx, _my, b_x, b_y, b_x + btn_w, b_y + btn_h))
            {
                ExecuteUiCommand(_sel, cmds[i].action);
            }
		}
	}
}
   

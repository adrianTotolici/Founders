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

    var btn_w = 100;
    var btn_h = 30;
    var padding = 10;

    var start_x = info_w + padding;
    var b_y = gui_h - bar_h + padding;

    if (mouse_check_button_pressed(mb_left))
    {
        for (var i = 0; i < array_length(cmds); i++)
        {
            var b_x = start_x + i * (btn_w + padding);

            if (point_in_rectangle(_mx, _my, b_x, b_y, b_x + btn_w, b_y + btn_h))
            {
                ExecuteUiCommand(_sel, cmds[i].action);
            }
		}
	}
}
   

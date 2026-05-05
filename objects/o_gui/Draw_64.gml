// 1. Draw the main Bottom Bar background
draw_set_color(c_dkgray);
draw_set_alpha(0.8);
draw_rectangle(0, gui_h - bar_h, gui_w, gui_h, false);

// 2. Draw the vertical divider for the Info Section
draw_set_color(c_white);
draw_set_alpha(1.0);
draw_line_width(info_w, gui_h - bar_h, info_w, gui_h, 2);

// 3. Draw Section Labels (Optional, helps with visual structure)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_ltgray);

// Info Logic
var _sel = noone;
with(o_animal) { 
	if (selected) 
		_sel = id;
		break;
}

// Info draw
if (_sel != noone && variable_instance_exists(_sel, "_stats")) {
	var _list = _sel._stats;
    var _start_y = gui_h - bar_h + 5;
    
    draw_set_color(c_white);
    
    for (var i = 0; i < array_length(_list); i++) {
        var _entry = _list[i];
        var _text = string(_entry.label) + ": " + string(_entry.key);
        
        draw_text(20, _start_y + (i * 25), _text);
    }
} else {
    draw_text(15, gui_h - bar_h + 15, "NO SELECTION");
}

// Action button draw

if (_sel != noone && variable_instance_exists(_sel, "_ui_commands"))
{
    var cmds = _sel._ui_commands;

    var btn_w = 100;
    var btn_h = 30;
    var padding = 10;

    var start_x = info_w + padding;
    var b_y = gui_h - bar_h + padding;

    for (var i = 0; i < array_length(cmds); i++)
    {
        var b_x = start_x + i * (btn_w + padding);

        // Button background
        draw_set_color(c_gray);
        draw_rectangle(b_x, b_y, b_x + btn_w, b_y + btn_h, false);

        // Label
        draw_set_color(c_white);
        draw_text(b_x + 10, b_y + 7, cmds[i].label);
    }
}


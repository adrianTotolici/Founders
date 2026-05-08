// menu button
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _mx_o = mouse_x;
var _my_o = mouse_y;

menu_btn_hover = point_in_rectangle(_mx, _my,
	menu_btn_x - menu_btn_w / 2,
	menu_btn_y - menu_btn_h / 2,
	menu_btn_x + menu_btn_w / 2,
	menu_btn_y + menu_btn_h / 2
);

if (menu_btn_hover && mouse_check_button_pressed(mb_left)) {
	room_goto(rm_menu);
}

mouse_on_ui = menu_btn_hover || (_my > display_get_gui_height() - _ui_bar_h);

// --- GLOBAL SELECTION LOGIC ---
if (mouse_check_button_pressed(mb_left) && !mouse_on_ui){
    // Clear previous selection
    with (o_selectable) selected = false;

    var _found = noone;

    // Manually check bounds of each selectable
    with (o_selectable){
        if (_mx_o >= x && _mx_o <= x + tile_size &&
            _my_o >= y && _my_o <= y + tile_size)
        {
            _found = id;
            break; // stop at the first hit
        }
    }

    if (_found != noone){
        _found.selected = true;
    }
}

// --- Detect hover over resources ---
var hover_resource = false;

with (o_resource){
    if (_mx_o >= x && _mx_o <= x + tile_size &&
        _my_o >= y && _my_o <= y + tile_size){
        hover_resource = true;
		break;
    }
}

if (hover_resource) {
	cursor_sprite = spr_mouse_gather;
}else{
	cursor_sprite = default_cursor_sprites[5];
}




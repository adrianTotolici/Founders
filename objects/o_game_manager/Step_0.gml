// --------------------------------------------------------------------------------------- Mouse Positions
var mx_gui = device_mouse_x_to_gui(0);
var my_gui = device_mouse_y_to_gui(0);

var mx = mouse_x;
var my = mouse_y;


// --------------------------------------------------------------------------------------- Menu Button Hover
menu_btn_hover = point_in_rectangle(
    mx_gui, my_gui,
    menu_btn_x - menu_btn_w / 2,
    menu_btn_y - menu_btn_h / 2,
    menu_btn_x + menu_btn_w / 2,
    menu_btn_y + menu_btn_h / 2
);

if (menu_btn_hover && mouse_check_button_pressed(mb_left))
{
    room_goto(rm_menu);
}


// ---------------------------------------------------------------------------------------- UI Hover
mouse_on_ui = menu_btn_hover || (my_gui > display_get_gui_height() - ui_bar_h);


// ---------------------------------------------------------------------------------------- Selection Logic
if (mouse_check_button_pressed(mb_left) && !mouse_on_ui) {
    with (o_selectable) selected = false;
    var found = noone;
    with (o_selectable)
    {
        if (mx >= x && mx <= x + tile_size &&
            my >= y && my <= y + tile_size)
        {
            found = id;
			other.selected_unit = id;  
            break;
        }
    }

    if (found != noone)
        found.selected = true;
}


// -------------------------------------------------------------------------------------------- Hover Resource
hover_resource = false;

with (o_resource) {
    if (mx >= x && mx <= x + tile_size && my >= y && my <= y + tile_size)
    {
        other.hover_resource = true;
		show_debug_message("hover")
        break;
    }
}


// --------------------------------------------------------------------------------------------- Human Selected
human_selected = false;

with (o_animal) {
    if (selected)
    {
        other.human_selected = true;
        break;
    }
}


// --------------------------------------------------------------------------------------------- Cursor Logic
if (hover_resource && human_selected) {
    cursor_sprite = spr_mouse_gather;
	show_debug_message("mouse")
} else {
    cursor_sprite = default_cursor_sprites[random_cursor_index];
}


// --------------------------------------------------------------------------------------------- Gather Logic
if (human_selected && selected_unit.state == "gather_waiting") {
    if (mouse_check_button_pressed(mb_left))
    {
        var _mx = camera_get_view_x(view_camera[0]) + device_mouse_x(0);
        var _my = camera_get_view_y(view_camera[0]) + device_mouse_y(0);

        with (o_resource)
        {
            if (_mx >= x && _mx <= x + tile_size &&
                _my >= y && _my <= y + tile_size)
            {
                other.selected_unit.target_resource = id;
                other.selected_unit.state = "gather_moving";
                break;
            }
        }
    }
}

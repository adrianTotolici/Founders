display_set_gui_size(window_get_width(), window_get_height());
var menu_instance = layer_get_id( "Menu");
var start_game = "START GAME";
var end_game = "EXIT";
var game_title = "Founders";
var game_version = "v0.1";

var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

// Create Start Button
var _btn_start = instance_create_layer(_cx, _cy - 40, menu_instance, o_btn,{
	sprite_index: spr_btn,
	button_text: start_game,
	text_color: c_black
});
_btn_start.button_action = function() {
    room_goto(rm_game); 
};

// Create Exit Button
var _btn_exit = instance_create_layer(_cx, _cy + 60, menu_instance, o_btn, {
	sprite_index: spr_btn,
	button_text: end_game,
	text_color: c_black
});
_btn_exit.button_action = function() {
    game_end();
};

//Add title text
instance_create_layer(display_get_gui_width()/2, 200, menu_instance, o_menu_gui, {
    text_content: game_title,
    text_color: c_yellow,
	x_scale: 3,
	y_scale: 3,
	text_rotation: 0
});

//Add version text
instance_create_layer(display_get_gui_width()-20, display_get_gui_height()-20, menu_instance, o_menu_gui, {
    text_content: game_version,
	x_scale: 1,
	y_scale: 1,
	text_rotation: 0
});

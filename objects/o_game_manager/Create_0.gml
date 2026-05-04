display_set_gui_size(window_get_width(), window_get_height());
var _tile_size = 64;
var _width  = floor(room_width / _tile_size);
var _height = floor(room_height / _tile_size);
var _layer_id = layer_get_id("map");
var _object_layer_id = layer_get_id("obj")

global.map_data = ds_grid_create(_width, _height);

// create_map
for (var i = 0; i < _width; i++) {
	for (var j = 0; j < _height; j++){
		rand_tile = RandomBiasNumb(7, 1, 5);
		ds_grid_set(global.map_data, i, j, new TileData(rand_tile));
	}
}
instance_create_layer(0,0, _layer_id, o_map, {
	_w :  _width,
	_h: _height,
	_layer_id: _layer_id,
	tile_set: ts_terrain
});

//add camera object
instance_create_layer(0, 0, _layer_id, o_camera, {
	_view_port: 0,
	_cam_w: 1920,
	_cam_h: 1080
});

// add gui to game
// menu button
ui_x_scale = 0.5;
ui_y_scale = 0.5;
menu_btn_w = sprite_get_width(spr_btn) * ui_x_scale;
menu_btn_h = sprite_get_height(spr_btn) * ui_y_scale;
menu_btn_x = display_get_gui_width() - (menu_btn_w / 2) - 20;
menu_btn_y = 40;
menu_btn_text = "Menu";
menu_btn_hover = false;

// ui layout
 _ui_bar_h = 120
_ui_info_w = 240
mouse_on_ui = false;
instance_create_depth(0, 0, _layer_id, o_gui, {
	gui_w: display_get_gui_width(),
	gui_h: display_get_gui_height(),
	bar_h: _ui_bar_h,
	info_w: _ui_info_w
});

//add humans on map
var init_x = 0;
var init_y = 0;
instance_create_layer(init_x, init_y, _layer_id, o_animal, {
	tile_sprite: spr_ts_human,
	tile_index: 4,
	tile_size: 64,
	movable: true,
	//move_speed: 4,
	target_x: init_x,
	target_y: init_y,
	//hp: 10,
	//name: "Human",
	_stats: [
        { label: "name",   key: "Human" },
        { label: "hp", key: 10   },
        { label: "speed",  key: 4 },
		{ label: "attack", key: 2 }
    ]
});
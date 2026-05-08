display_set_gui_size(window_get_width(), window_get_height());
var _tile_size = 64;
var _width  = floor(room_width / _tile_size);
var _height = floor(room_height / _tile_size);
var _layer_id = layer_get_id("map");
var _object_layer_id = layer_get_id("obj")

global.map_data = ds_grid_create(_width, _height);

default_cursor_sprites = [
    spr_mouse_arrow_1,
    spr_mouse_arrow_2,
    spr_mouse_arrow_3,
    spr_mouse_arrow_4,
    spr_mouse_arrow_5,
    spr_mouse_arrow_6
];
var random_cursor_index = irandom(array_length(default_cursor_sprites) - 1);

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
	target_x: init_x,
	target_y: init_y,
	_stats: [
        { label: "name",   key: "Human" },
        { label: "hp", key: 10   },
        { label: "speed",  key: 4 },
		{ label: "attack", key: 2 }
    ],
	_ui_commands: [
		{ label: "Build", action: "build", _button_w: 64, _button_h: 64, icon: { sprite: spr_ts_ui_command, index: 1, _sp_width: 64, _sp_height: 64 }},
		{ label: "Gather", action: "gather", _button_w: 64, _button_h: 64, icon: { sprite: spr_ts_ui_command, index: 2, _sp_width: 64, _sp_height: 64 }}
	]
});

//add resources on map at random position
var berry_bush_amount = 25; // how many berry bushes to spawn
for (var i = 0; i < berry_bush_amount; i++)
{
    var gx = irandom(ds_grid_width(global.map_data) - 1);
    var gy = irandom(ds_grid_height(global.map_data) - 1);
    if (global.map_data[# gx, gy].is_walkable)
    {
        var px = gx * 64;
        var py = gy * 64;
        instance_create_layer(px, py, _layer_id, o_resource, {
			resource_type: "berry_bush",
			movable: false,
			tile_size: 64,
			tile_sprite: spr_ts_resources,
            tile_index: 1,
			_stats: [
		        { label: "name",   key: "Berry bush" },
		        { label: "food", key: 10   }
		    ]
		});
    }
}
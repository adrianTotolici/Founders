// ---------------------------------------------------------------------------------------------------------- GUI Setup
display_set_gui_size(window_get_width(), window_get_height());
selected_unit = noone;


//----------------------------------------------------------------------------------------------------------- Map Setup
tile_size = 64;
map_w = floor(room_width  / tile_size);
map_h = floor(room_height / tile_size);

layer_map  = layer_get_id("map");
layer_obj  = layer_get_id("obj");

global.map_data = ds_grid_create(map_w, map_h);


// ---------------------------------------------------------------------------------------------------------- Gui
ui_x_scale = 0.5;
ui_y_scale = 0.5;

menu_btn_w = sprite_get_width(spr_btn)  * ui_x_scale;
menu_btn_h = sprite_get_height(spr_btn) * ui_y_scale;

menu_btn_x = display_get_gui_width() - (menu_btn_w / 2) - 20;
menu_btn_y = 40;
menu_btn_text = "Menu";
menu_btn_hover = false;

top_bar_h = -120;
ui_bar_h  = 120;
ui_info_w = 240;
mouse_on_ui = false;

global.food = 0;

instance_create_depth(0, 0, layer_map, o_gui, {
    gui_w: display_get_gui_width(),
    gui_h: display_get_gui_height(),
    bar_h: ui_bar_h,
    info_w: ui_info_w
});


// ------------------------------------------------------------------------------------------------------- Cursor Setup
default_cursor_sprites = [
    spr_mouse_arrow_1,
    spr_mouse_arrow_2,
    spr_mouse_arrow_3,
    spr_mouse_arrow_4,
    spr_mouse_arrow_5,
    spr_mouse_arrow_6
];

random_cursor_index = irandom(array_length(default_cursor_sprites) - 1);
cursor_sprite = default_cursor_sprites[random_cursor_index];


// -------------------------------------------------------------------------------------------------------- Generate Map Tiles
for (var i = 0; i < map_w; i++){
	for (var j = 0; j < map_h; j++)
	{
	    var rand_tile = RandomBiasNumb(7, 1, 5);
	    ds_grid_set(global.map_data, i, j, new TileData(rand_tile));
	}
}

instance_create_layer(0, 0, layer_map, o_map, {
    _w: map_w,
    _h: map_h,
    _layer_id: layer_map,
    tile_set: ts_terrain
});


// --------------------------------------------------------------------------------------------------------- Camera
instance_create_layer(0, 0, layer_map, o_camera, {
    _view_port: 0,
    _cam_w: 1920,
    _cam_h: 1080
});

// --------------------------------------------------------------------------------------------------- Spawn Human
var init_x = 100;
var init_y = 10;

instance_create_layer(init_x, init_y, layer_map, o_animal, {
    tile_sprite: spr_ts_human,
    walk_index: 4,
	gather_index: 9,
    tile_size: 64,
    movable: true,
    target_x: init_x,
    target_y: init_y,

    _stats: [
        { label: "name",   key: "Human" },
        { label: "hp",     key: 10 },
        { label: "speed",  key: 4 },
        { label: "attack", key: 2 }
    ],

    _ui_commands: [
        { label: "Build",  action: "build",  _button_w: 64, _button_h: 64, icon: {  sprite: spr_ts_ui_command, 
																																index: 1, 
																																_sp_width: 64, 
																																_sp_height: 64}
		},
        { label: "Gather", action: "gather", _button_w: 64, _button_h: 64, icon: {  sprite: spr_ts_ui_command, 
																																	index: 2, 
																																	_sp_width: 64, 
																																	_sp_height: 64}
		}
    ]
});


// ------------------------------------------------------------------------------------------------------ Spawn Resources
var berry_bush_amount = 25;

for (var i = 0; i < berry_bush_amount; i++) {
    var gx = irandom(map_w - 1);
    var gy = irandom(map_h - 1);

    if (global.map_data[# gx, gy].is_walkable) {
        var px = gx * tile_size;
        var py = gy * tile_size;

        instance_create_layer(px, py, layer_map, o_resource, {
            resource_type: "berry_bush",
            movable: false,
            tile_size: 64,
            tile_sprite: spr_ts_resources,
            tile_index: 1,
            _stats: [
                { label: "name", key: "Berry bush" },
                { label: "amount", key: 10 }
            ]
        });
    }
}

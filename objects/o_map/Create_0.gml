var _tilemap_id = layer_tilemap_create(_layer_id, 0, 0, tile_set, _w, _h);

for (var i = 0; i < _w; i++) {
    for (var j = 0; j < _h; j++) {
        var _cell = ds_grid_get(global.map_data, i, j);
        if (is_struct(_cell)) {
            tilemap_set(_tilemap_id, _cell.visual_id, i, j);
        } else {
            tilemap_set(_tilemap_id, 1, i, j); 
        }
    }
}
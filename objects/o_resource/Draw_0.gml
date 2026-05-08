event_inherited();
// c. Your existing draw_sprite_part logic here
var _cols = sprite_get_width(tile_sprite) / tile_size;
var _left = (tile_index % _cols) * tile_size;
var _top  = floor(tile_index / _cols) * tile_size;

draw_sprite_part(tile_sprite, 0, _left, _top, tile_size, tile_size, x, y);
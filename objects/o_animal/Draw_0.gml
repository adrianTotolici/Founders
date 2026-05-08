event_inherited();
// b. Destination Indicator (briefly shows when target set)
if (target_confirmed) {
    // Calculate feet position of the target location
    var _t_feet_x = target_x + (tile_size / 2);
    var _t_feet_y = target_y + tile_size;
    var _t_radius = tile_size / 8; // Small circle

    draw_set_color(c_white);
    draw_set_alpha(0.5);
    draw_circle(_t_feet_x, _t_feet_y, _t_radius, false); // Solid
    draw_circle(_t_feet_x, _t_feet_y, _t_radius + 2, true); // Outline
}

// Reset Draw Settings
draw_set_alpha(1.0);
draw_set_color(c_white);

// c. Your existing draw_sprite_part logic here
var _cols = sprite_get_width(tile_sprite) / tile_size;
var _left = (tile_index % _cols) * tile_size;
var _top  = floor(tile_index / _cols) * tile_size;

if (is_moving) {
    if (image_xscale == -1) {
        draw_sprite_ext(sprite_index, image_index, x - sprite_width, y, -1, 1, 0, c_white, 1);
    } else {
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
    }
}
else {
    // Idle tile sprite
    draw_sprite_part(tile_sprite, 0, _left, _top, tile_size, tile_size, x, y);
}
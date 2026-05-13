event_inherited();

// --- Destination Indicator ---
if (target_confirmed) {
    var _t_feet_x = target_x + (tile_size / 2);
    var _t_feet_y = target_y + tile_size;
    var _t_radius = tile_size / 8;

    draw_set_color(c_white);
    draw_set_alpha(0.5);
    draw_circle(_t_feet_x, _t_feet_y, _t_radius, false);
    draw_circle(_t_feet_x, _t_feet_y, _t_radius + 2, true);
}

draw_set_alpha(1);
draw_set_color(c_white);

// --- ANIMATION DRAW LOGIC ---
var _cols = sprite_get_width(tile_sprite) / tile_size;
var _left = (walk_index % _cols) * tile_size;
var _top  = floor(walk_index / _cols) * tile_size;

// If walking OR gathering → draw animated sprite
if (is_moving || state == "gathering") {

    if (image_xscale == -1) {
        draw_sprite_ext(sprite_index, image_index, x - sprite_width, y, -1, 1, 0, c_white, 1);
    } else {
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
    }

// If idle → draw static tile sprite
} else {
    draw_sprite_part(tile_sprite, 0, _left, _top, tile_size, tile_size, x, y);
}

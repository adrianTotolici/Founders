// Determine "feet" position (base of the sprite)
var _feet_x = x + (tile_size / 2);
var _feet_y = y + tile_size;

// a. Selection Ring (Flattened Circle/Ellipse)
if (selected) {
    // Radius of the ring
    var _r_width = tile_size / 2;
    var _r_height = tile_size / 4; // 2:1 ratio flatten for perspective

    // Base color
    draw_set_color(c_lime); 

    // Filled alpha part
    draw_set_alpha(0.5);
    draw_ellipse(_feet_x - _r_width, _feet_y - _r_height, _feet_x + _r_width, _feet_y + _r_height, false);

    // Outline part
    draw_set_alpha(0.8);
    draw_ellipse(_feet_x - _r_width, _feet_y - _r_height, _feet_x + _r_width, _feet_y + _r_height, true);
}
function MoveSelected(_id, _movable, _ui_blocked)
{
    if (!_movable) return;

    with (_id)
    {

        if (!_ui_blocked)
        {
            // --- Selection logic ---
            if (mouse_check_button_pressed(mb_left))
            {
                var _mx = mouse_x;
                var _my = mouse_y;

                selected =
                    (_mx >= x && _mx <= x + tile_size &&
                     _my >= y && _my <= y + tile_size);
            }

            // --- Destination logic ---
            if (selected && mouse_check_button_pressed(mb_right))
            {
                var _grid_x = floor(mouse_x / tile_size);
                var _grid_y = floor(mouse_y / tile_size);

                var _map_w = ds_grid_width(global.map_data);
                var _map_h = ds_grid_height(global.map_data);

                if (_grid_x >= 0 && _grid_x < _map_w &&
                    _grid_y >= 0 && _grid_y < _map_h)
                {
                    target_x = mouse_x - (tile_size / 2);
                    target_y = mouse_y - (tile_size / 2) - 35;
                    target_confirmed = true;
                }
            }
        }

        if (target_confirmed)
        {
            if (point_distance(x, y, target_x, target_y) > move_speed)
            {
                var _angle = point_direction(x, y, target_x, target_y);
                x += lengthdir_x(move_speed, _angle);
                y += lengthdir_y(move_speed, _angle);
            }
            else
            {
                x = target_x;
                y = target_y;
                target_confirmed = false;
            }
        }
    }
}

// Reference the manager's live variable directly
var _blocked = o_game_manager.mouse_on_ui;

MoveSelected(id, movable, _blocked);

// --- Movement detection ----
is_moving = (x != xprevious) || (y != yprevious);

var _dx = x - xprevious;
var _dy = y - yprevious;
move_angle = point_direction(0, 0, _dx, _dy);
mirror = (move_angle > 90 && move_angle < 270);

WalkAnimation(anim_human_walk, tile_index);
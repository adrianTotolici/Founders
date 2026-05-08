event_inherited();
Movment(id, movable, _blocked);

// --- Movement detection ----
is_moving = (x != xprevious) || (y != yprevious);

var _dx = x - xprevious;
var _dy = y - yprevious;
move_angle = point_direction(0, 0, _dx, _dy);
mirror = (move_angle > 90 && move_angle < 270);

WalkAnimation(anim_human_walk, tile_index);
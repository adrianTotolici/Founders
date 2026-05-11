event_inherited();
Movment(id, movable, _blocked);

// --- Movement detection ----
is_moving = (x != xprevious) || (y != yprevious);

var _dx = x - xprevious;
var _dy = y - yprevious;
move_angle = point_direction(0, 0, _dx, _dy);
mirror = (move_angle > 90 && move_angle < 270);

WalkAnimation(anim_human_walk, tile_index);

switch (state)
{
    case "gather_moving":
        if (target_resource != noone) {
            // Move toward resource
            var tx = target_resource.x;
            var ty = target_resource.y;

            target_x = tx;
            target_y = ty;

            if (point_distance(x, y, tx, ty) < 10)
            {
                state = "gathering";
                gather_timer = 0;
            }
        }
		break;
	case "gathering":
	    if (target_resource != noone) {
	        gather_timer += delta_time / 1000000; // seconds

	        if (gather_timer >= 0.5) // 2 per second
	        {
	            gather_timer = 0;

	            // Take 1 from resource
	            target_resource.amount -= 1;
	            global.food += 1;

	            if (target_resource.amount <= 0)
	            {
	                with (target_resource) instance_destroy();
	                state = "idle";
	                target_resource = noone;
	            }
	        }
	    }
		break;
}
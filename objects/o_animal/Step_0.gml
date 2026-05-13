event_inherited();
Movment(id, movable, _blocked);

// --- Movement detection ----
is_moving = (x != xprevious) || (y != yprevious);

var _dx = x - xprevious;
var _dy = y - yprevious;
move_angle = point_direction(0, 0, _dx, _dy);
mirror = (move_angle > 90 && move_angle < 270);


if (state == "gathering") {
    GatherAnimation(anim_human_gather_berry, gather_index);
} else {
    WalkAnimation(anim_human_walk, walk_index);
}

switch (state) {
    case "gather_moving":
	    if (target_resource != noone) {
	        var tx = target_resource.x + target_resource.tile_size * 0.5;
	        var ty = target_resource.y + target_resource.tile_size * 0.5;

	        target_x = tx;
	        target_y = ty;

	        // When close enough, switch to gathering
	        if (point_distance(x, y, tx, ty) < tile_size * 0.5)
	        {
	            state = "gathering";
	            gather_timer = 0;
	        }
	    }
		break;

	case "gathering":
	    if (target_resource != noone) {
	        // Check if human is physically touching the resource tile
	        if (x >= target_resource.x - tile_size &&
	            x <= target_resource.x + tile_size &&
	            y >= target_resource.y - tile_size &&
	            y <= target_resource.y + tile_size) {
	            gather_timer += delta_time / 1000000;

	            if (gather_timer >= 0.5) {
	                gather_timer = 0;

	                target_resource.amount -= 1;
	                global.food += 1;
					for (var i = 0; i < array_length(target_resource._stats); i++) {
					    if (target_resource._stats[i].label == "amount") {
					        target_resource._stats[i].key = target_resource.amount;
					        break;
					    }
					}

	                if (target_resource.amount <= 0) {
	                    with (target_resource) instance_destroy();
	                    target_resource = noone;
	                    state = "idle";
	                }
	            }
	        } else {
	            // If human moved away, go back to moving toward resource
	            state = "gather_moving";
	        }
	    }
		break;
}
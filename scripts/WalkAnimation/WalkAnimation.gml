function WalkAnimation(anim_sprite, static_sprite_index){	
	if (is_moving) {
		if (move_angle > 90 && move_angle < 270) {
			image_xscale = -1;
		} else {
			image_xscale = 1;
		}
	}
	
	if (is_moving) {
		if (sprite_index != anim_sprite) {
			sprite_index =  anim_sprite;
		}
		image_speed = 2;
	} else {
		 if (sprite_index != static_sprite_index) {
            sprite_index = static_sprite_index;
        }
        image_speed = 0;
        image_index = 0; 
		image_xscale = 1;
	}
}
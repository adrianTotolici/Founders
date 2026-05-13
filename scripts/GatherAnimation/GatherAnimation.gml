function GatherAnimation(gather_sprite, static_sprite_index) {

    // Face the resource (optional)
    if (move_angle > 90 && move_angle < 270) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    // Switch to gather animation
    if (sprite_index != gather_sprite) {
        sprite_index = gather_sprite;
    }

    image_speed = 0.3; // slow loop
}

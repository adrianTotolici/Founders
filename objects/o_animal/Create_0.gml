event_inherited();
target_confirmed = false;

// --- State and Movement ---
target_x = x;
target_y = y;

for (var i = 0; i < array_length(_stats); i++) {
    var _item = _stats[i];
    
    // Check the label to know which variable to assign
    if (_item.label == "speed") move_speed = _item.key;
    if (_item.label == "hp")    hp = _item.key;
    if (_item.label == "name")  name = _item.key;
}

state = "idle";
target_resource = noone;
gather_timer = 0;

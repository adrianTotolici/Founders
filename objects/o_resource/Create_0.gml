event_inherited();
for (var i = 0; i < array_length(_stats); i++) {
    var _item = _stats[i];
    if (_item.label == "amount")    amount = _item.key;
    if (_item.label == "name")  name = _item.key;
}
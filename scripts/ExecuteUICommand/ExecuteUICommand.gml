function ExecuteUiCommand(_inst, _action)
{
    if (!instance_exists(_inst)) return;

    switch (_action)
    {
        case "move":
            _inst.target_confirmed = false;
        break;

        case "stop":
            _inst.target_confirmed = false;
        break;

        case "produce":
            show_debug_message("Produce unit");
        break;
    }
}

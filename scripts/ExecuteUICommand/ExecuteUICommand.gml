function ExecuteUiCommand(_inst, _action)
{
    if (!instance_exists(_inst)) return;

    switch (_action)
    {
        case "build":
			show_debug_message("Build");
        break;

        case "gather":
			_inst.state = "gather_waiting";
		break;
    }
}

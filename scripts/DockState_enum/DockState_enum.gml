enum DockState {
	None,
	Drag,
	Hover,
	Interact,
}

function DockStateToString(state_) {
	switch(state_) {
		case DockState.None:
			return "None";
		case DockState.Drag:
			return "Drag";
		case DockState.Hover:
			return "Hover";
		case DockState.Interact:
			return "Interact";
		default:
			throw("DockStateToString");
	}
}

function DockStateToColor(state_) {
	switch(state_) {
		case DockState.None:
			return c_white;
		case DockState.Drag:
			return c_red;
		case DockState.Hover:
			return c_blue;
		case DockState.Interact:
			return c_green;
		default:
			throw("DockStateToString");
	}
}
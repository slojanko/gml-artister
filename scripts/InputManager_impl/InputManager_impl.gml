function InputManager() constructor{
	global.mouse_position = new Vector2(0, 0);
	global.mouse_position_previous = new Vector2(0, 0);
	global.mouse_position_delta = new Vector2(0, 0);
	
	focused_dock = undefined;
	
	function Update() {
		global.mouse_position_previous.Set(global.mouse_position);
		global.mouse_position.Set(mouse_x, mouse_y);
		
		global.mouse_position_delta.Set(global.mouse_position);
		global.mouse_position_delta.Sub(global.mouse_position_previous);
		
		if (mouse_check_button_pressed(mb_left)) {
			HandleLeftPress();
		} else if (mouse_check_button(mb_left)) {
			HandleLeftHold();
		} else if (mouse_check_button_released(mb_left)) {
			HandleLeftRelease();
		} else {
			HandleLeftMove();
		}
	}
	
	function HandleLeftPress() {
		var new_focused_dock_ = GetDockUnderMouse();
		global.pDockManager.FocusDock(new_focused_dock_);
		UpdateMouseDock(new_focused_dock_, DockState.Drag);
	}
	
	function HandleLeftHold() {
		if (focused_dock == undefined) {
			return;
		}
		
		focused_dock.rect.position.Add(global.mouse_position_delta);
	}
	
	function HandleLeftRelease() {
		if (focused_dock == undefined) {
			return;
		}
		
		UpdateMouseDock(undefined, DockState.Hover);
	}
	
	function HandleLeftMove() {
		if (!IsFocusedDockPassive()) {
			return;
		}
		
		var new_focused_dock_ = GetDockUnderMouse();
		UpdateMouseDock(new_focused_dock_, DockState.Hover);
	}
	
	
	function IsFocusedDockPassive() {
		return focused_dock == undefined || focused_dock.state == DockState.None || focused_dock.state == DockState.Hover;
	}
	
	function GetDockUnderMouse() {
		for(var i = global.docks_count - 1; i >= 0 ; i--) {
			if (global.pDockManager.docks[| i].rect.IsPointInside(global.mouse_position)) {
				return global.pDockManager.docks[| i];
			}
		}
		
		return undefined;
	}
	
	function UpdateMouseDock(new_focused_dock_, state_) {
		if (focused_dock != undefined) {
			focused_dock.state = DockState.None;
		}
		
		focused_dock = new_focused_dock_;
		
		if (focused_dock != undefined) {
			focused_dock.state = state_;
		}
	}
}
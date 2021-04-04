function InputManager() constructor{
	mouse_position = new Vector2(0, 0);
	mouse_position_previous = new Vector2(0, 0);
	mouse_position_delta = new Vector2(0, 0);
	
	focused_dock = undefined;
	
	function Update() {
		mouse_position_previous.Set(mouse_position);
		mouse_position.Set(mouse_x, mouse_y);
		
		mouse_position_delta.Set(mouse_position);
		mouse_position_delta.Sub(mouse_position_previous);
		
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
		
		focused_dock.rect.position.Add(mouse_position_delta);
	}
	
	function HandleLeftRelease() {
		if (focused_dock == undefined) {
			return;
		}
		
		UpdateMouseDock(undefined, DockState.None);
		
		// After releasing immediatelly start tracking mouse movement
		HandleLeftMove();
	}
	
	function HandleLeftMove() {
		// Prevent switching focused dock if already interacting with another one
		if (focused_dock != undefined && focused_dock.state != DockState.None && focused_dock.state != DockState.Hover) {
			return;
		}
		
		var new_focused_dock_ = GetDockUnderMouse();
		UpdateMouseDock(new_focused_dock_, DockState.Hover);
	}
	
	function GetDockUnderMouse() {
		for(var i = global.docks_count - 1; i >= 0 ; i--) {
			if (global.pDockManager.docks[| i].rect.IsPointInside(mouse_position)) {
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
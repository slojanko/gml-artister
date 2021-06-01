function InputManager() constructor{
	global.mouse_position = new Vector2(0, 0);
	global.mouse_position_previous = new Vector2(0, 0);
	global.mouse_position_delta = new Vector2(0, 0);
	
	focused_window = undefined;
	
	static Update = function() {
		UpdateMousePosition();
		
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
	
	static UpdateMousePosition = function() {
		global.mouse_position_previous.Set(global.mouse_position);
		global.mouse_position.Set(mouse_x, mouse_y);
		
		global.mouse_position_delta.Set(global.mouse_position);
		global.mouse_position_delta.Sub(global.mouse_position_previous);
	}
	
	static HandleLeftPress = function() {
		var new_focused_window_ = GetWindowUnderMouse();
		
		if (new_focused_window_ == undefined) {
			return;
		}
		
		global.pWindowManager.FocusWindow(new_focused_window_);
		ChangeWindowState(new_focused_window_, WindowState.Interact);
		
		new_focused_window_.HandleLeftPress();
	}
	
	static HandleLeftHold = function() {
		if (focused_window == undefined) {
			return;
		}
		
		focused_window.HandleLeftHold();
	}
	
	static HandleLeftRelease = function() {
		if (focused_window == undefined) {
			return;
		}
		
		focused_window.HandleLeftRelease();
		ChangeWindowState(undefined, WindowState.Hover);
	}
	
	static HandleLeftMove = function() {
		if (!AllowSwitchingWindow()) {
			return;
		}
		
		var new_focused_window_ = GetWindowUnderMouse();
		
		ChangeWindowState(new_focused_window_, WindowState.Hover);
		
		if (new_focused_window_ != undefined) {
			new_focused_window_.HandleLeftMove();
		}
	}
	
	static AllowSwitchingWindow = function() {
		return focused_window == undefined || focused_window.state == WindowState.None || focused_window.state == WindowState.Hover;
	}
	
	static GetWindowUnderMouse = function() {
		for(var i = global.window_count - 1; i >= 0 ; i--) {
			if (global.windows[| i].IsPointInside(global.mouse_position)) {
				return global.windows[| i];
			}
		}
		
		return undefined;
	}
	
	static ChangeWindowState = function(new_focused_window_, state_) {
		if (focused_window != undefined) {
			focused_window.state = WindowState.None;
		}
		
		focused_window = new_focused_window_;
		
		if (focused_window != undefined) {
			focused_window.state = state_;
		}
	}
}
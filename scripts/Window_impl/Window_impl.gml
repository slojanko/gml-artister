function Window() constructor {
	id = -1;
	rect = new Rect(new Vector2(global.mouse_position.x, global.mouse_position.y), new Vector2(300, 300));
	
	// State
	previous_state = WindowState.Hover;
	state = WindowState.None;
	interact_substate = WindowInteract.None;
	
	// Flags
	destroy_called = false;
	is_dirty = true;
	
	// Content
	surface = -1;
	widgets = ds_map_create();
	
	function HandleLeftPress() {
		if (global.mouse_position.y < rect.position.y + 24) {
			if (global.mouse_position.x > rect.position.x + rect.size.x - 24) {
				interact_substate = WindowInteract.Close;
			} else {
				interact_substate = WindowInteract.Drag;
			}
		} else {
			interact_substate = WindowInteract.Window;
		}
	}
	
	function HandleLeftHold() {
		if (interact_substate == WindowInteract.Drag) {
			rect.position.Add(global.mouse_position_delta);
		}
	}
	
	function HandleLeftRelease() {		
		if (global.mouse_position.y < rect.position.y + 24) {
			if (global.mouse_position.x > rect.position.x + rect.size.x - 24) {
				if (interact_substate == WindowInteract.Close) {
					global.pWindowManager.DeleteWindow(self);
				} else {
					interact_substate = WindowInteract.None;
				}
			} else {
				interact_substate = WindowInteract.None;
			}
		} else {
			interact_substate = WindowInteract.None;
		}
	}
	
	function Update() {
		is_dirty = (previous_state != state || state != WindowState.None);
		previous_state = state;
	}
	
	function Render() {
		if (!surface_exists(surface)) {
			surface = surface_create(rect.size.x, rect.size.y);
			is_dirty = true;
		}
		
		if (is_dirty) {
			surface_set_target(surface);
			
			draw_sprite_stretched_ext(window_spr, 0, 0, 0, rect.size.x, rect.size.y, WindowStateToColor(state), 1.0);
			draw_text(4, 30, "ID: " + string(id));
			draw_text(4, 44, WindowStateToString(state));
			draw_text(4, 58, WindowInteractToString(interact_substate));
		
			surface_reset_target();
			
			is_dirty = false;
		}
		
		draw_surface(surface, rect.position.x, rect.position.y);
	}
	
	function Destroy() {
		if (destroy_called) {
			return;
		}
		
		destroy_called = true;
		
		if (surface_exists(surface)) {
			surface_free(surface);
		}
		
		global.pGarbageManager.QueueDestroy(self);
	}
}
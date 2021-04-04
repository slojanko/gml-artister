function Dock() constructor {
	rect = new Rect(new Vector2(100, 100), new Vector2(300, 300));
	previous_state = DockState.None;
	state = DockState.None;
	is_dirty = true;
	destroy_called = false;
	
	// Content
	surface = -1;
	window = undefined;
	
	function Update() {
		is_dirty = (previous_state != state || state != DockState.None);
		previous_state = state;
	}
	
	function Render() {
		if (!surface_exists(surface)) {
			surface = surface_create(rect.size.x, rect.size.y);
		}
		
		if (is_dirty) {
			surface_set_target(surface);
			
			draw_sprite_stretched_ext(dock_spr, 0, 0, 0, rect.size.x, rect.size.y, DockStateToColor(state), 1.0);
			draw_text(0, 0, DockStateToString(state));
		
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
		
		global.pDockManager.RemoveDock(self);
		global.pGarbageManager.QueueDestroy(self);
	}
}
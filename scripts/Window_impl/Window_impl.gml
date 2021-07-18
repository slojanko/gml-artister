function Window() constructor {
	id = global.pWindowManager.AddWindow(self);
	sprite = window_spr;
	rect = new Rect(new Vector2(global.mouse_position.x, global.mouse_position.y), new Vector2(300, 300));
	slice = sprite_get_nineslice(sprite);
	surface = undefined;
	
	// State
	previous_state = WindowState.Hover;
	state = WindowState.None;
	local_mouse_position = new Vector2(0, 0);
	
	// Flags
	destroy_called = false;
	is_dirty = false;
	
	// Content
	widgets = ds_map_create();
	focused_widget = undefined;
		
	var close_ = new CloseWidget(self);
	widgets[? "close"] = close_;
		
	var drag_ = new DragWidget(self);
	widgets[? "drag"] = drag_;
		
	var resize_ = new ResizeWidget(self)
	widgets[? "resize"] = resize_;
	
	static HandleLeftPress = function() {
		var new_focused_widget_ = GetWidgetUnderMouse();
		
		if (new_focused_widget_ == undefined) {
			return;
		}
		
		focused_widget = new_focused_widget_;
		focused_widget.HandleLeftPress();
	}
	
	static HandleLeftHold = function() {		
		if (focused_widget == undefined) {
			return;
		}
		
		focused_widget.HandleLeftHold();
	}
	
	static HandleLeftRelease = function() {			
		if (focused_widget == undefined) {
			return;
		}
		
		focused_widget.HandleLeftRelease();
		focused_widget = undefined;
	}
	
	static HandleLeftMove = function() {
		var new_focused_widget_ = GetWidgetUnderMouse();
		
		if (new_focused_widget_ == undefined) {
			return;
		}
		
		focused_widget = new_focused_widget_;
		focused_widget.HandleLeftMove();
	}
	
	static Update = function() {
		local_mouse_position.Set(global.mouse_position);
		local_mouse_position.Sub(rect.position);
		
		is_dirty = previous_state != state || state != WindowState.None;
		previous_state = state;
		
		var key = ds_map_find_first(widgets);
		for(var i = 0; i < ds_map_size(widgets); i++) {
			widgets[? key].Update();
			key = ds_map_find_next(widgets, key);
		}
	}
	
	static Render = function() {
		if (!surface_exists(surface) ) {
			surface = surface_create(rect.size.x, rect.size.y);
			is_dirty = true;
		}
		
		if (surface_get_width(surface) != rect.size.x || surface_get_height(surface) != rect.size.y) {
			surface_resize(surface, rect.size.x, rect.size.y);
			is_dirty = true;
		}
		
		if (is_dirty) {
			surface_set_target(surface);
			
			draw_sprite_stretched(sprite, 0, 0, 0, rect.size.x, rect.size.y);
		
			var key = ds_map_find_first(widgets);
			for(var i = 0; i < ds_map_size(widgets); i++) {
				widgets[? key].Render();
				key = ds_map_find_next(widgets, key);
			}
			
			draw_text_ext(4, 28, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", 16, rect.size.x - 8);
		
			surface_reset_target();
			
			is_dirty = false;
		}
		
		draw_surface(surface, rect.position.x, rect.position.y);
	}
	
	static GetWidgetUnderMouse = function() {
		var key = ds_map_find_first(widgets);
		for(var i = 0; i < ds_map_size(widgets); i++) {
			
			if (widgets[? key].IsPointInside(local_mouse_position)) {
				return widgets[? key];
			}
			key = ds_map_find_next(widgets, key);
		}
		
		return undefined;
	}
	
	static IsPointInside = function(point_) {
		return rect.IsPointInside(point_);
	}
	
	static Destroy = function() {
		if (destroy_called) {
			return;
		}
		
		destroy_called = true;
		
		if (surface_exists(surface)) {
			surface_free(surface);
		}
		
		ds_map_destroy(widgets);
		
		global.pWindowManager.RemoveWindow(self);
		global.pGarbageManager.QueueDestroy(self);
	}
}
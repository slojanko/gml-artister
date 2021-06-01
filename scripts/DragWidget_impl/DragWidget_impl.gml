function DragWidget(window_) : Widget(window_) constructor{
	static Update = function() {
		rect.size.Set(window.rect.size.x - 24, window.slice.top);
	}
	
	static HandleLeftHold = function() {
		window.rect.position.Add(global.mouse_position_delta);
	}
}
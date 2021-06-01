function ResizeWidget(window_) : Widget(window_) constructor{
	rect.size.Set(12, 12);
	
	static Update = function() {
		rect.position.Set(window.rect.size.x - 12, window.rect.size.y - 12);
	}
	
	static HandleLeftHold = function() {
		window.rect.size.Add(global.mouse_position_delta);
		window.rect.size.Max(72, 72);
	}
}
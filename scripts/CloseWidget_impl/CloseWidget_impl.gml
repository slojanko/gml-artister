function CloseWidget(window_) : Widget(window_) constructor {
	sprite = close_spr;
	rect.size.Set(24, 24);
	
	static Update = function() {
		rect.position.Set(window.rect.size.x - 24, 0);
	}
	
	static Render = function() {
		draw_sprite(sprite, 0, rect.position.x + 12, rect.position.y + 12);
	}
	
	static HandleLeftRelease = function() {
		if (IsMouseInside()) {
			window.Destroy();
		}
	}
}
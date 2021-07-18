function Widget(window_){
	window = window_;
	rect = new Rect(new Vector2(0, 0), new Vector2(0, 0));
	
	static Update = function() {
	}
	
	static Render = function() {
	}
	
	static HandleLeftPress = function() {
	}
	
	static HandleLeftHold = function() {
	}
	
	static HandleLeftRelease = function() {
	}
	
	static HandleLeftMove = function() {
	}
	
	static IsPointInside = function(point_) {
		return rect.IsPointInside(point_);
	}
	
	static IsMouseInside = function() {
		return IsPointInside(window.local_mouse_position);
	}
}
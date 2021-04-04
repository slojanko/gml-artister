function Vector2(x_, y_) constructor{
	x = x_;
	y = y_;
	
	function Set(other_) {
		if (is_struct(other_)) {
			x = other_.x;
			y = other_.y;
		} else {
			x = argument[0];
			y = argument[1];
		}
	}
	
	function Add(other_) {
		if (is_struct(other_)) {
			x += other_.x;
			y += other_.y;
		} else {
			x += argument[0];
			y += argument[1];
		}
	}
	
	function Sub(other_) {
		if (is_struct(other_)) {
			x -= other_.x;
			y -= other_.y;
		} else {
			x -= argument[0];
			y -= argument[1];
		}
	}
}
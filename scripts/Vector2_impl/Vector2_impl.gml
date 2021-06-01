function Vector2(x_, y_) constructor{
	x = 0;
	y = 0;
	
	Set(x_, y_);
	
	static Set = function() {
		if (is_struct(argument[0])) {
			x = argument[0].x;
			y = argument[0].y;
		} else {
			x = argument[0];
			y = argument[1];
		}
	}
	
	static Add = function() {
		if (is_struct(argument[0])) {
			x += argument[0].x;
			y += argument[0].y;
		} else {
			x += argument[0];
			y += argument[1];
		}
	}
	
	static Sub = function() {
		if (is_struct(argument[0])) {
			x -= argument[0].x;
			y -= argument[0].y;
		} else {
			x -= argument[0];
			y -= argument[1];
		}
	}
	
	static Max = function() {
		if (is_struct(argument[0])) {
			x = max(x, argument[0].x);
			y = max(y, argument[0].y);
		} else {
			x = max(x, argument[0]);
			y = max(y, argument[1]);
		}
	}
}
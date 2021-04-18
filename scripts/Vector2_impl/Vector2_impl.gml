function Vector2(x_, y_) constructor{
	x = x_;
	y = y_;
	
	function Set() {
		if (is_struct(argument[0])) {
			x = argument[0].x;
			y = argument[0].y;
		} else {
			x = argument[0];
			y = argument[1];
		}
	}
	
	function Add() {
		if (is_struct(argument[0])) {
			x += argument[0].x;
			y += argument[0].y;
		} else {
			x += argument[0];
			y += argument[1];
		}
	}
	
	function Sub() {
		if (is_struct(argument[0])) {
			x -= argument[0].x;
			y -= argument[0].y;
		} else {
			x -= argument[0];
			y -= argument[1];
		}
	}
}
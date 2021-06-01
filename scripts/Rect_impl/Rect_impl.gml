function Rect(position_, size_) constructor {
	position = position_;
	size = size_;
	
	static IsPointInside = function(point_) {
		return point_in_rectangle(point_.x, point_.y, position.x, position.y, position.x + size.x, position.y + size.y);
	}
}
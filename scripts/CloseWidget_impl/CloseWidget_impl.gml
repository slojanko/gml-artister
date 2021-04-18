function CloseWidget() constructor {
	sprite = close_spr;
	window = undefined;
	rect = new Rect(new Vector2(0, 0), new Vector2(sprite_get_width(sprite), sprite_get_height(sprite)));
	
	function Init(window_) {
		window = window_;
	}
	
	function Render() {
	
	}
}
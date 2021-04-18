function WindowManager() constructor{
	global.windows = ds_list_create();
	global.window_count = 0;
	unique_id = 0;
	
	function AddWindow(window_) {
		ds_list_add(global.windows, window_);
		window_.id = unique_id++;
		global.window_count++;
	}
	
	function FocusWindow(window_) {
		if (window_ != undefined) {
			var index = ds_list_find_index(global.windows, window_);
			ds_list_delete(global.windows, index);
			ds_list_add(global.windows, window_);
		}
	}
	
	function RemoveWindow(window_) {
		var index = ds_list_find_index(global.windows, window_);
		ds_list_delete(global.windows, index);
		global.window_count--;
	}
	
	function DeleteWindow(window_) {
		window_.Destroy();
		RemoveWindow(window_);
	}
	
	function Update() {
		for(var i = 0; i < global.window_count; i++) {
			global.windows[| i].Update();
		}
	}
	
	function RenderWindows() {
		draw_set_font(main_font);
		for(var i = 0; i < global.window_count; i++) {
			global.windows[| i].Render();
		}
		
		draw_text(0, 32, "Number of windows " + string(global.window_count));
	}
}
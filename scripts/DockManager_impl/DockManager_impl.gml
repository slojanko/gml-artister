function DockManager() constructor{
	docks = ds_list_create();
	global.docks_count = 0;
	unique_id = 0;
	
	function AddDock(dock_) {
		ds_list_add(docks, dock_);
		dock_.id = unique_id++;
		global.docks_count++;
	}
	
	function FocusDock(dock_) {
		if (dock_ != undefined) {
			var index = ds_list_find_index(docks, dock_);
			ds_list_delete(docks, index);
			ds_list_add(docks, dock_);
		}
	}
	
	function RemoveDock(dock_) {
		var index = ds_list_find_index(docks, dock_);
		ds_list_delete(docks, index);
		global.docks_count--;
	}
	
	function DeleteDock(dock_) {
		dock_.Destroy();
		RemoveDock(dock_);
	}
	
	function Update() {
		for(var i = 0; i < global.docks_count; i++) {
			docks[| i].Update();
		}
	}
	
	function RenderDocks() {
		draw_set_font(main_font);
		for(var i = 0; i < global.docks_count; i++) {
			docks[| i].Render();
		}
		
		draw_text(0, 32, "Number of docks " + string(global.docks_count));
	}
}
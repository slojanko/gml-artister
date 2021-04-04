function DockManager() constructor{
	docks = ds_list_create();
	global.docks_count = 0;
	
	function AddDock(dock_) {
		ds_list_add(docks, dock_);
		global.docks_count++;
	}
	
	function FocusDock(dock_) {
		if (dock_ != undefined) {
			RemoveDock(dock_);
			AddDock(dock_);
		}
	}
	
	function RemoveDock(dock_) {
		var index = ds_list_find_index(docks, dock_);
		if (is_real(index)) {
			ds_list_delete(docks, index);
			global.docks_count--;
		}
	}
	
	function Update() {
		for(var i = 0; i < global.docks_count; i++) {
			docks[| i].Update();
		}
	}
	
	function RenderDocks() {
		for(var i = 0; i < global.docks_count; i++) {
			docks[| i].Render();
		}
	}
}
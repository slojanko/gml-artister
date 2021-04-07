if (mouse_check_button_pressed(mb_middle)) {
	var dock_ = new Dock();
	dock_.rect.position.Set(global.pInputManager.mouse_position);
	global.pDockManager.AddDock(dock_);
}

if (mouse_check_button_pressed(mb_right)) {
	var dock_ = global.pInputManager.GetDockUnderMouse();
	global.pDockManager.DeleteDock(dock_);
}
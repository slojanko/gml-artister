enum Split {
	None,
	Horizontal,
	Vertical
}

function Dock_impl(){
	split = Split.None;
	
	// Content
	window = undefined;
	first_dock = undefined;
	second_dock = undefined;
}
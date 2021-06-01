enum WindowState {
	None,
	Hover,
	Interact,
}

//enum WindowInteract {
//	None,
//	Drag,
//	Content,
//	Close,
//}

//function WindowStateToString(state_) {
//	switch(state_) {
//		case WindowState.None:
//			return "None";
//		case WindowState.Hover:
//			return "Hover";
//		case WindowState.Interact:
//			return "Interact";
//		default:
//			throw("WindowStateToString");
//	}
//}

//function WindowInteractToString(state_) {
//	switch(state_) {
//		case WindowInteract.None:
//			return "None";
//		case WindowInteract.Drag:
//			return "Drag";
//		case WindowInteract.Content:
//			return "Content";
//		case WindowInteract.Close:
//			return "Close";
//		default:
//			throw("WindowInteractToString");
//	}
//}

//function WindowStateToColor(state_) {
//	switch(state_) {
//		case WindowState.None:
//			return c_white;
//		case WindowState.Hover:
//			return c_yellow;
//		case WindowState.Interact:
//			return c_red;
//		default:
//			throw("WindowStateToString");
//	}
//}
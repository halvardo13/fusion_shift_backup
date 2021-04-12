//Save state
if (enter_save_state == true) {
	Save();
	enter_save_state = false;
	
	read_str = "Game Saved";
	str_alpha = 3.75;
}


//Load state 
if (enter_load_state == true) {
	Load();
	enter_load_state = false;
	
	read_str = "Game Loaded";
	str_alpha = 3.75;
}









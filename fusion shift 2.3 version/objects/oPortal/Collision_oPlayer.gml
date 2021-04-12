if (active == true) and (oEndlessController.enter_warp == false) {
	with (oEndlessController) {
		enter_warp = true;
		increase_difficulty = true;
		
		
	}
	active = false;
	instance_destroy();
}
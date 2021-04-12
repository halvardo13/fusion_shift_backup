if (global.game_pause == true) or (global.timeStop == true) {
	exit;
}

image_index = state;

//Timer
if (state == 1) {
	timer = max(timer - 1,0);
	if (timer <= 0) {
		state = 0;
	
	
		timer = timer_set;	
	}
}




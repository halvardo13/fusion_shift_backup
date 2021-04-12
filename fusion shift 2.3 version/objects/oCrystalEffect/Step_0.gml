if (global.game_pause == true) {
	speed = 0;
	exit;	
}

alpha = max(alpha - 0.075,0);
speed = spd*global.time;
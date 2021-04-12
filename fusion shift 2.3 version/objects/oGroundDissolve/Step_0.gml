if (place_meeting(x,y-1,pEnemy)) hit_player = true;

if (hit_player == true) {
	timer_destroy = max(timer_destroy - 1,0);
	if (timer_destroy <= 0) {
		instance_destroy();
	
	}
	
}


if (global.game_pause == true) or (global.timeStop == true) or (oGamePlay.levelComplete == true) {
	if (oGamePlay.levelComplete == true) image_index = 0;
	exit;	
}

//Check range
if (image_index = 0) {
	var enemyRange = 0;
	if (instance_exists(pEnemy)) {
	var eClose = (instance_nearest(x,y,pEnemy));
	var enemyRange = point_distance(x,y,eClose.x,eClose.y);
	}
	var playerRange = point_distance(x,y,oPlayer.x,oPlayer.y);
	if (global.timeStop == false) idle_timer = max(idle_timer - 1,0);
	
	if (playerRange <= range) or (enemyRange <= range) {
		if (idle_timer <= 0) {
		image_index = 1;
		idle_timer = idle_timer_set;	
		}
	}
}

//Set To index 2
if (image_index == 1) {
	if (global.timeStop == false) timer_1 = max(timer_1 - 1,0);
	if (timer_1 <= 0) {
		image_index = 2;	
		
		timer_1 = timer_1_set;
	}
	
}

//Reset to normal
if (image_index == 2) {
	if (global.timeStop == false) reset_timer = max(reset_timer - 1,0);
	if (reset_timer <= 0) {
		image_index = 0;
		
		reset_timer = reset_timer_set;
	}
	
	
}




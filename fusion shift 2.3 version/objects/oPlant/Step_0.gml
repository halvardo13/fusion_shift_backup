if (global.game_pause == true) or (global.timeStop == true) {

	exit;
}

//Find nearest enemy
if (instance_exists(pEnemy)) {
	var enemyID = instance_nearest(x,y,pEnemy);

}
else exit;

//Toggle Attack
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,range)) or (point_in_circle(enemyID.x,enemyID.y,x,y,range)) {
	if (attack == false) and (image_index == 0) {
		attack = true;
	
		attack_timer = attack_timer_set;
		return_timer = return_timer_set;
	}
}

//Attack
if (attack == true) {
	attack_timer = max(attack_timer - 1,0);
	if (attack_timer <= 0) {
		x = xstart;
		attack = false;
		
		image_index = 1;
		flash = 1;
	}
	else x = Wave(xstart - 1.2,xstart + 1.2,0.15,0);
}

//Return to normal
if (image_index == 1) {
	return_timer = max(return_timer - 1,0);
	if (return_timer <= 0) {
		image_index = 0;
		return_timer = return_timer_set;
	}
}



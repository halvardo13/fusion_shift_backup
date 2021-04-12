if (global.game_pause == true) or (global.timeStop == true) {
	
	exit;
}

fRate = max(fRate - 1,0);
if (fRate <= 0) and (instance_exists(pEnemy)) {
	//Check near + distance
	var enemyNear = instance_nearest(x,y,pEnemy);
	var distEnemy = point_distance(x,x,enemyNear.x,enemyNear.x);	
	var distPlayer = point_distance(x,x,oPlayer.x,oPlayer.x);
	var dir = 0;
	if (image_xscale == -1) dir = 180;
	
	//Shoot
	for (var i = 0;i <= 2;i++) {
		var yy = y;
		if (i == 1) yy = y + 6;
		if (i == 2) yy = y - 6;
		if (distEnemy <= range) or (distPlayer <= range) {
			with (instance_create_layer(x,yy,"Bullets",oArrowEnemy)) {
				direction = dir;
				image_angle = dir;
			
				mySpd = random_range(4,5);
				POWER = 0.1;
			
				damage = global.damage_bow * 0.5;
			}
			fRate = fRateMax;
			flash = 1;
		}
	}
	
	
	
}




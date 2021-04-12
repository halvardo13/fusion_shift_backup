//Pause
if (global.game_pause == true) or (global.timeStop == true) or (!instance_exists(oPirateBoss)) {
	
	
	exit;	
}
alpha = Approach(alpha,0,0.004);

//Activate
if (activate == true) {
	alpha = 1;
	
	activate = false;
	attack = true;
	up_time = up_time_set;
}

//Shoot
if (attack == true) {
	var xx = x;
	var yy = 16;
	
	fRate = max(fRate - 1,0);
	if (fRate <= 0) {
		with (instance_create_layer(xx+random_range(+48,-48),yy,"Bullets",oPirateBossBullet)) {
			direction = 270;
			image_angle = 270;
			
			mySpd = random_range(1.3,1.85);
			damage = oPirateBossCanon.target_damage;
		
		}
		fRate = fRateSet;
	}
	
	up_time = max(up_time - 1,0);
	if (up_time <= 0) attack = false;
	
}

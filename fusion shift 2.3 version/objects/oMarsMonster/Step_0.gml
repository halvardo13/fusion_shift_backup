if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;
	
	exit;
}
image_speed = 1;


//Shoot
fRate = max(fRate - 1,0);
if (fRate == 0) {
	with (instance_create_layer(x,y,"Bullets",oMarsBullet)) {
		direction = 90;
		image_angle = direction;
		spd_set = 2;
		speed = spd_set;
	}
	fRate = fRateMax;
}




if (hp <= 0) {
	instance_destroy();	
	
	
}
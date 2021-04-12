if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;
	
	exit;
}


//Go random direction
direction += random_range(-45,45);
move_bounce_solid(false);


life_time -= 1;
if (life_time <= 0) {
	image_speed = 1;
	speed = 0;
	if (image_index == clamp(image_index,1.5,1.9)) {
		instance_create_layer(x,y,"Enemies",oEnemyTribe);
		
		image_index = 2;
	}

	
	
}

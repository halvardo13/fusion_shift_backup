if (global.game_pause == true) {
	speed = 0;
	image_speed = 0;
	
	exit;
}

event_inherited();

//Switch state
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,bat_radius)) {
	bat_state = 1;
	
	
}



//State 
switch(bat_state) {
	case 0:
		direction = random_range(0,360);
		
		//random 
	break;
	
	case 1:
		speed = bat_speed*global.time;
		image_angle = direction;
		sprite_index = sBatFlying;
		
		image_speed = 1*global.time;
	break;
}
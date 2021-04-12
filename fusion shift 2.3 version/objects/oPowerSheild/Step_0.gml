if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;	
	exit;
}
image_speed = 1;

//Move
if (can_move == true) {
	x = Approach(x,xstart+(move_range * move_to),1);
	if (x == xstart+(move_range * move_to)) {
		if (move_to == 1) move_to = -1;	
		else move_to = 1;
		
	}
}

//Inherent Event
event_inherited();
//Follow
if (instance_exists(ownerID)) and (holding_spear == true) and (can_pickup == false) {
	x = ownerID.x;
	y = ownerID.y;

	var d = layer_get_depth("Other");
	depth = d;
}

switch(can_use) {
	//Enemy
	case 0:	
		
		
	break;
	//Player
	case 1:
		var m_dir = point_direction(x,y,mouse_x,mouse_y);
		if (holding_spear == true) {
			image_angle = m_dir;
		
			//Throw
			if (mouse_check_button_pressed(mb_left)) {
				holding_spear = false;
				direction = m_dir;
				speed = spd;
			
			}
			
		}
		else {			
			var d = layer_get_depth("Spear");
			depth = d;
			if (speed != 0) motion_add(270,0.025);
			image_angle = direction;
			//Collision
			if (place_meeting(x,y,pCollision)) {
				while(place_meeting(x,y,pCollision)) {
					x -= lengthdir_x(1,direction);
					y -= lengthdir_y(1,direction);
				}
				speed = 0;
				can_pickup = true;
			}	

			if (speed == 0) and (place_meeting(x,y,ownerID)) and (can_pickup == true) {
				holding_spear = true;
				can_pickup = false;

		
			}
		}
		
		
		
	
	break;
}
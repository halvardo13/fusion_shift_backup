event_inherited();

//radius = set_radius;

mySheild = instance_create_layer(x,y,"Other3",oSheild);
with (mySheild) {
	owner = other.id;
		
}

//Can move
if (can_move == true) {
	sprite_index = sPowerMove;		
}

//lerp_val = 0;




move_to = 1;
move_range = 64;





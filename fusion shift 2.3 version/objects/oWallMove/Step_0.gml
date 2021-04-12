//Move player/enemy
var _id = instance_place(x,y-1,pEnemy);
with (_id) {
	if (other.can_move == true) hsp_move = other.hsp_move;
}

//Disable/enable mask_index
no_mask_timer = max(no_mask_timer - 1,0);
if (oPlayer.y < y) and (no_mask_timer <= 0) mask_index = set_mask;
else mask_index = -1;

//
if (keyboard_check_pressed(ord("S"))) {
	mask_index = -1;
	no_mask_timer = no_mask_timer_set;	
}

//Horizontal Collision
if (can_move == true) {
	if (point_in_circle(pCollision.x,pCollision.y,x,y,32)) {
		instance_destroy();
		
		hsp_move = !hsp_move;
	}
	x += hsp_move;
}




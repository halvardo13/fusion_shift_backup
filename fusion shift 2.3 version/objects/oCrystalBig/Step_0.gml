if (hp <= 0) {
	
	//Fall
	vsp += grv;
	vsp = clamp(vsp,-0.5,10);
	y += vsp;
	
	
	//Hit Ground
	if (place_meeting(x,y+1,pCollision)) {
		instance_destroy();
		
	
	}
	
}
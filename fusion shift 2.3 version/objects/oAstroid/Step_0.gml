if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;
	 
	exit;	
}

if (place_meeting(x,y,pCollision)) sprite_index = sAstoriodDestroyed;
if (sprite_index == sAstoriodDestroyed) {
	image_speed = 1;	
	grv = 0;
	vsp = 0;
}


vsp = vsp + grv;
vsp = clamp(vsp,-0.4,10);
y += vsp;
//Collision
if (place_meeting(x,y,pCollision)) {
	while(place_meeting(x,y,pCollision)) {
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	mySpd = 0;
	var ChangeTo = oBulletHitspark;
	if (sprite_index == sBulletCannon) var ChangeTo = oBulletHitsparkCannon;
	instance_change(ChangeTo,true);
}


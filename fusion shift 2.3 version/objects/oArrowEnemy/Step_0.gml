if (global.game_pause == true) {
	speed = 0;
	exit;
}
if (speed != 0) and (global.timeStop == false) motion_add(270,POWER);
image_angle = direction;
speed = mySpd*global.time;

if (global.timeStop == false) bulletLife += 1;

//Move
//var spd = mySpd * global.time;
//x += lengthdir_x(spd,direction);
//y += lengthdir_y(spd,direction);

if (image_index != 0) image_index = 1;


//Collision
if (place_meeting(x,y,pCollision)) {
	speed = 0;
	while(place_meeting(x,y,pCollision)) {
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	mySpd = 0;
	instance_change(oBulletHitsparkEnemy,true);
}




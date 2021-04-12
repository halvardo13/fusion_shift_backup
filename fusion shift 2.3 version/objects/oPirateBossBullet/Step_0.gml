if (global.game_pause == true) exit;

if (global.timeStop == false) bulletLife += 1;


if (!instance_exists(oPirateBoss)) instance_destroy();

//Move
var spd = mySpd * global.time;
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

if (image_index != 0) image_index = 1;


//Collision
if (place_meeting(x,y,pCollision)) {
	while(place_meeting(x,y,pCollision)) {
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	mySpd = 0;
	instance_change(oBulletHitspark,true);
}




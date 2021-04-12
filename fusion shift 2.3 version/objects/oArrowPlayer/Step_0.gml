if (global.game_pause == true) {
	speed  = 0;
	exit;
}
//Move
var spd = mySpd * global.time;
//x += lengthdir_x(spd,direction);
//y += lengthdir_y(spd,direction);

speed = spd;


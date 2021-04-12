if (global.game_pause == true) exit;

//Move
var spd = mySpd * global.time;
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);



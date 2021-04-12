if (global.game_pause == true) exit;

//Scale + alpha
alpha = max(alpha - 0.05,0);
scale = min(1000,scale + 0.075);
image_xscale = scale;
image_yscale = scale;
if (alpha <= 0) {
	instance_destroy();	
}



//Move
var spd = mySpd * global.time;
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);



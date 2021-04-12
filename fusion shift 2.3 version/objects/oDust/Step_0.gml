if (global.game_pause == true) {
	speed = 0;
	image_speed = 0;
	exit;	
}
speed = spd * global.time;
image_speed = 1 * global.time;

if (global.timeStop == false) alpha = max(alpha - alpha_spd, 0);
if (alpha <= 0) instance_destroy();



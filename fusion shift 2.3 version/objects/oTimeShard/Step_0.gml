if (global.game_pause == true) {
	speed = 0;	
	exit;
}



if (global.timeStop == false) alpha -= alpha_decr;
if (global.timeStop == false) spd = max(spd - spd_decr,0);
speed = spd* global.time;
direction = dir;



if (alpha <= 0) instance_destroy();
if (global.game_pause == true) or (global.timeStop == true) {
	
	image_speed = 0;
	exit;	
}
else image_speed = 1;


//Wave
PirateBossWave(5,1.35);
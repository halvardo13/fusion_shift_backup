//Pause
if (global.game_pause == true) or (instance_exists(oStopTimeZone)) {
	exit;
}

//Disolve
disolve = Approach(disolve,0,disolve_spd*global.time);
scale = Approach(scale,10,0.05);
if (disolve == 0) {
	instance_destroy();	
}





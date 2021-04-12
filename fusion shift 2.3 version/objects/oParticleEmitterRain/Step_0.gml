//Pause Emmiter
if (global.game_pause == true) or (global.timeStop == true) {
	part_system_automatic_update(rain,false);
		
}
else part_system_automatic_update(rain,true);




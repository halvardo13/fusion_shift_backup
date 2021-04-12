//Move transition
if (mode != t_mode.off) {
	if (dir == 0) {
		percent = Approach(percent,percent_target,spd);	
	}
	else {
		percent = Approach(percent,0,spd);	
		if (percent == 0) {
			dir = 0;
			mode = t_mode.off;
		}
	}
	
}


//Goto room
if (dir == 0) and (mode != t_mode.off) and (percent == percent_target) {
	switch (mode) {	
		//Next room
		case t_mode.next:
			room_goto_next();
			dir = 1;
			
			with (oSaveLoad) enter_save_state = true;
		break;
		//Target room
		case t_mode.goto:
			room_goto(target_room);
			dir = 1;
			
			with (oSaveLoad) enter_save_state = true;
		break;
		//Restart
		case t_mode.restart:
			//with (oGamePlay) 
		
			room_restart();
			dir = 1;
			
			with (oSaveLoad) enter_save_state = true;
		break;
		//Endgame
		case t_mode.endgame:
			with (oSaveLoad) enter_save_state = true;
			
			game_end();
			dir = 1;
		break;


	}
	
	oCamera.blackbar_size = 0;
}





function World_3() {
	switch(menu_courser) {
	
		case 1:
			if (global.game_progression >= 18) LevelStart(t_mode.goto,rmLvl_3_1,"level");
		break;
	
		case 2:
			if (global.game_progression >= 19) LevelStart(t_mode.goto,rmLvl_3_2,"level");
		break;
	
		case 3:
			if (global.game_progression >= 20) LevelStart(t_mode.goto,rmLvl_3_3,"level");		
		break;
	
		case 4:
			if (global.game_progression >= 21) LevelStart(t_mode.goto,rmLvl_3_4,"level");	
		break;	
	
		case 5:
			if (global.game_progression >= 22) LevelStart(t_mode.goto,rmLvl_3_5,"level");
		break;	
	
		case 6:
			if (global.game_progression >= 23) LevelStart(t_mode.goto,rmLvl_3_6,"level");
		break;	
	
		case 7:
			if (global.game_progression >= 24) LevelStart(t_mode.goto,rmLvl_3_7,"level");
		break;	
	
		case 8:
			if (global.game_progression >= 25) LevelStart(t_mode.goto,rmLvl_3_8,"level");
		break;	
	
		case 9:
			if (global.game_progression >= 26) LevelStart(t_mode.goto,rmLvl_3_9,"level");	
		break;
	
		case 10:	
			page = 1;
			menu_courser = 3;
		break;
	}


}

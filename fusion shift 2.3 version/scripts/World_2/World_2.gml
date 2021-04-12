function World_2() {
	switch(menu_courser) {
		case 1:
			if (global.game_progression >= 9) LevelStart(t_mode.goto,rmLvl_2_1,"level");
		break;
	
		case 2:
			if (global.game_progression >= 10) LevelStart(t_mode.goto,rmLvl_2_2,"level");
		break;
	
		case 3:
			if (global.game_progression >= 11) LevelStart(t_mode.goto,rmLvl_2_3,"level");		
		break;
	
		case 4:
			if (global.game_progression >= 12) LevelStart(t_mode.goto,rmLvl_2_4,"level");	
		break;	
	
		case 5:
			if (global.game_progression >= 13) LevelStart(t_mode.goto,rmLvl_2_5,"level");
		break;	
	
		case 6:
			if (global.game_progression >= 14) LevelStart(t_mode.goto,rmLvl_2_6,"level");	
		break;	
	
		case 7:
			if (global.game_progression >= 15) LevelStart(t_mode.goto,rmLvl_2_7,"level");
		break;	

		case 8:
			if (global.game_progression >= 16) LevelStart(t_mode.goto,rmLvl_2_8,"level");
		break;	
	
		case 9:
			if (global.game_progression >= 17) LevelStart(t_mode.goto,rmLvl_2_9,"level");	
		break;
	
		case 10:	
			page = 1;
			menu_courser = 2;
		break;	
	}


}

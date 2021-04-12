function World_1() {
	switch(menu_courser) {
		case 1:
			if (global.game_progression >= 0) LevelStart(t_mode.goto,rmLvl_1_1,"level");
		break;

		case 2:
			if (global.game_progression >= 1) LevelStart(t_mode.goto,rmLvl_1_2,"level");
		break;

		case 3:
			if (global.game_progression >= 2) LevelStart(t_mode.goto,rmLvl_1_3,"level");
		break;

		case 4:
			if (global.game_progression >= 3) LevelStart(t_mode.goto,rmLvl_1_4,"level");
		break;	

		case 5:
			if (global.game_progression >= 4) LevelStart(t_mode.goto,rmLvl_1_5,"level");
		break;	

		case 6:
			if (global.game_progression >= 5) LevelStart(t_mode.goto,rmLvl_1_6,"level");
		break;	
	
		case 7:
			if (global.game_progression >= 6) LevelStart(t_mode.goto,rmLvl_1_7,"level");
		break;
	
		case 8:
			if (global.game_progression >= 7) LevelStart(t_mode.goto,rmLvl_1_8,"level");
		break;
	
		case 9:
			if (global.game_progression >= 8) LevelStart(t_mode.goto,rmLvl_1_9,"level");
		break;
	
		case 10:	
			page = 1;
		break;
	}


}

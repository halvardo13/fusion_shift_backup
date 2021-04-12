///UpdateAchievmentList();
///Call whenever the steam achievments needs updating.
///Script will check all achievments and reward those that need rewarding
function UpdateAchievementList() {
	if (global.steamAPI == false) exit;

	//Achievment 1 - complete_world_1
	if (global.game_progression >= 9) {
		if (steam_get_achievement("complete_world_1") == false) {
			steam_set_achievement("complete_world_1");
		}
	}

	//Achievment 2 - complete_world_2
	if (global.game_progression >= 18) {
		if (steam_get_achievement("complete_world_2") == false) {
			steam_set_achievement("complete_world_2");
		}
	}

	//Achievment 3 - complete_world_3
	if (global.game_progression == 27) {
		if (steam_get_achievement("complete_world_3") == false) {
			steam_set_achievement("complete_world_3");
		}
	}

	//Achievment 4 - complete_game
	if (global.game_progression == 27) and (room == rSpace) {
		if (steam_get_achievement("complete_game") == false) {	
			steam_set_achievement("complete_game");	
		}
	}

	//Achievment 5 - complete_hardcore_mode
	if (global.hardcore_mode == true) and (room == rSpace) {
		if (steam_get_achievement("complete_hardcore_mode") == false) {
			steam_set_achievement("complete_hardcore_mode");
		}
	}

	//Achievment 6 - gauntlet_score_5000
	if (global.scr >= 5000) {
		if (steam_get_achievement("gauntlet_score_5000") == false) {	
			steam_set_achievement("gauntlet_score_5000");
		}
	}

	//Achievment 7 - gauntlet_score_15000
	if (global.scr == 15000) {
		if (steam_get_achievement("gauntlet_score_15000") == false) {
			steam_set_achievement("gauntlet_score_15000");
		}
	}
	//Achievment 8 - gauntlet_score_15000
	//In coconut


}

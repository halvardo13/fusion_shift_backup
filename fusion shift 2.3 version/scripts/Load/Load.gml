function Load() {
	if (file_exists("fusion_shift_gamesave.game")) {
		var _wrapper = LoadJSONFromFile("fusion_shift_gamesave.game");
		var _list = _wrapper[? "ROOT_FILE"];
	
		for (var i = 0; i < ds_list_size(_list); i++) {
			var _map = _list[| i];
		
			//Load data back
			var progress = _map[? "game_progress"];
			global.game_progression = progress;
			var hiscore = _map[? "gauntlet_scr"];
			global.high_scr = hiscore;
			var totalK = _map[? "total_kills"];
			global.stat_total_kills = totalK;
			var totalD = _map[? "total_deaths"];
			global.stat_total_deaths = totalD;
			var gComp = _map[? "game_comp"];		
			global.game_complete = gComp;
			var hcbt = _map[? "HC_BT"];
			global.stat_best_hardcore_time = hcbt;
		
			//Load controls
			var up = _map[? "keyUp"];
			global.c_up = up;
			var down = _map[? "keyDown"];
			global.c_down = down;
			var left = _map[? "keyLeft"];
			global.c_left = left;
			var right = _map[? "keyRight"];
			global.c_right = right;		
			var jump = _map[? "keyJump"];
			global.c_jump = jump;
			var takeover = _map[? "keyTakeOver"];
			global.c_take_over = takeover;
		
		
			//Load audio setting
			var sfx_setting = _map[? "gain_sfx_setting"];
			global.gain_SFX = sfx_setting;
			var sfx_real = _map[? "gain_sfx_real"];
			global.SFX_gain = sfx_real;
		
			var music_setting = _map[? "gain_music_setting"];
			global.gain_MUSIC = music_setting;
			var music_real = _map[? "gain_music_real"];
			global.MUSIC_gain = music_real;		
		
		
			//Level 1-1
			var best_time_1_1 = _map[? "best_time_level_1_1"];
			global.stat_time_lvl_1_1 = best_time_1_1;
			//Level 1-2
			var best_time_1_2 = _map[? "best_time_level_1_2"];
			global.stat_time_lvl_1_2 = best_time_1_2;
			//Level 1-3
			var best_time_1_3 = _map[? "best_time_level_1_3"];
			global.stat_time_lvl_1_3 = best_time_1_3;
			//Level 1-4
			var best_time_1_4 = _map[? "best_time_level_1_4"];
			global.stat_time_lvl_1_4 = best_time_1_4;
			//Level 1-5
			var best_time_1_5 = _map[? "best_time_level_1_5"];
			global.stat_time_lvl_1_5 = best_time_1_5;
			//Level 1-6
			var best_time_1_6 = _map[? "best_time_level_1_6"];
			global.stat_time_lvl_1_6 = best_time_1_6;		
			//Level 1-7
			var best_time_1_7 = _map[? "best_time_level_1_7"];
			global.stat_time_lvl_1_7 = best_time_1_7;		
			//Level 1-8
			var best_time_1_8 = _map[? "best_time_level_1_8"];
			global.stat_time_lvl_1_8 = best_time_1_8;
			//Level 1-9
			var best_time_1_9 = _map[? "best_time_level_1_9"];
			global.stat_time_lvl_1_9 = best_time_1_9;		
		
		
			//Level 2-1
			var best_time_2_1 = _map[? "best_time_level_2_1"];
			global.stat_time_lvl_2_1 = best_time_2_1;
			//Level 2-2
			var best_time_2_2 = _map[? "best_time_level_2_2"];
			global.stat_time_lvl_2_2 = best_time_2_2;		
			//Level 2-3
			var best_time_2_3 = _map[? "best_time_level_2_3"];
			global.stat_time_lvl_2_3 = best_time_2_3;
			//Level 2-4
			var best_time_2_4 = _map[? "best_time_level_2_4"];
			global.stat_time_lvl_2_4 = best_time_2_4;		
			//Level 2-5
			var best_time_2_5 = _map[? "best_time_level_2_5"];
			global.stat_time_lvl_2_5 = best_time_2_5;		
			//Level 2-6
			var best_time_2_6 = _map[? "best_time_level_2_6"];
			global.stat_time_lvl_2_6 = best_time_2_6;
			//Level 2-7
			var best_time_2_7 = _map[? "best_time_level_2_7"];
			global.stat_time_lvl_2_7 = best_time_2_7;
			//Level 2-8
			var best_time_2_8 = _map[? "best_time_level_2_8"];
			global.stat_time_lvl_2_8 = best_time_2_8;
			//Level 2-8
			var best_time_2_8 = _map[? "best_time_level_2_8"];
			global.stat_time_lvl_2_8 = best_time_2_8;
			//Level 2-9
			var best_time_2_9 = _map[? "best_time_level_2_9"];
			global.stat_time_lvl_2_9 = best_time_2_9;
		
		
			//Level 3-1
			var best_time_3_1 = _map[? "best_time_level_3_1"];
			global.stat_time_lvl_3_1 = best_time_3_1;		
			//Level 3-2
			var best_time_3_2 = _map[? "best_time_level_3_2"];
			global.stat_time_lvl_3_2 = best_time_3_2;
			//Level 3-3
			var best_time_3_3 = _map[? "best_time_level_3_3"];
			global.stat_time_lvl_3_3 = best_time_3_3;	
			//Level 3-4
			var best_time_3_4 = _map[? "best_time_level_3_4"];
			global.stat_time_lvl_3_4 = best_time_3_4;			
			//Level 3-5
			var best_time_3_5 = _map[? "best_time_level_3_5"];
			global.stat_time_lvl_3_5 = best_time_3_5;	
			//Level 3-6
			var best_time_3_6 = _map[? "best_time_level_3_6"];
			global.stat_time_lvl_3_6 = best_time_3_6;	
			//Level 3-7
			var best_time_3_7 = _map[? "best_time_level_3_7"];
			global.stat_time_lvl_3_7 = best_time_3_7;
			//Level 3-8
			var best_time_3_8 = _map[? "best_time_level_3_8"];
			global.stat_time_lvl_3_8 = best_time_3_8;	
			//Level 3-9
			var best_time_3_9 = _map[? "best_time_level_3_9"];
			global.stat_time_lvl_3_9 = best_time_3_9;	
		}
	
		ds_map_destroy(_wrapper);
		if (global.myDebug == true) show_debug_message("Game Loaded!");
	
	
	}
	else {
		//No save found	
	
	
	
	}





}

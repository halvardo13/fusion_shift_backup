function Save() {
	//Creat root list
	var _root_list = ds_list_create();

	//Create map
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); 

	//Progression
	ds_map_add(_map,"game_progress",global.game_progression);
	ds_map_add(_map,"gauntlet_scr",global.high_scr);
	ds_map_add(_map,"total_kills",global.stat_total_kills);
	ds_map_add(_map,"total_deaths",global.stat_total_deaths);
	ds_map_add(_map,"game_comp",global.game_complete);
	ds_map_add(_map,"HC_BT",global.stat_best_hardcore_time);

	//Save controls
	ds_map_add(_map,"keyUp",global.c_up);
	ds_map_add(_map,"keyDown",global.c_down);
	ds_map_add(_map,"keyLeft",global.c_left);
	ds_map_add(_map,"keyRight",global.c_right);
	ds_map_add(_map,"keyJump",global.c_jump);
	ds_map_add(_map,"keyTakeOver",global.c_take_over);

	//Save audio settings
	ds_map_add(_map,"gain_sfx_setting",global.gain_SFX);
	ds_map_add(_map,"gain_sfx_real",global.SFX_gain);

	ds_map_add(_map,"gain_music_setting",global.gain_MUSIC);
	ds_map_add(_map,"gain_music_real",global.MUSIC_gain);


	//Save best time each level
	//World 1
	ds_map_add(_map,"best_time_level_1_1",global.stat_time_lvl_1_1);
	ds_map_add(_map,"best_time_level_1_2",global.stat_time_lvl_1_2);
	ds_map_add(_map,"best_time_level_1_3",global.stat_time_lvl_1_3);
	ds_map_add(_map,"best_time_level_1_4",global.stat_time_lvl_1_4);
	ds_map_add(_map,"best_time_level_1_5",global.stat_time_lvl_1_5);
	ds_map_add(_map,"best_time_level_1_6",global.stat_time_lvl_1_6);
	ds_map_add(_map,"best_time_level_1_7",global.stat_time_lvl_1_7);
	ds_map_add(_map,"best_time_level_1_8",global.stat_time_lvl_1_8);
	ds_map_add(_map,"best_time_level_1_9",global.stat_time_lvl_1_9);

	//World 2
	ds_map_add(_map,"best_time_level_2_1",global.stat_time_lvl_2_1);
	ds_map_add(_map,"best_time_level_2_2",global.stat_time_lvl_2_2);
	ds_map_add(_map,"best_time_level_2_3",global.stat_time_lvl_2_3);
	ds_map_add(_map,"best_time_level_2_4",global.stat_time_lvl_2_4);
	ds_map_add(_map,"best_time_level_2_5",global.stat_time_lvl_2_5);
	ds_map_add(_map,"best_time_level_2_6",global.stat_time_lvl_2_6);
	ds_map_add(_map,"best_time_level_2_7",global.stat_time_lvl_2_7);
	ds_map_add(_map,"best_time_level_2_8",global.stat_time_lvl_2_8);
	ds_map_add(_map,"best_time_level_2_9",global.stat_time_lvl_2_9);

	//World 3
	ds_map_add(_map,"best_time_level_3_1",global.stat_time_lvl_3_1);
	ds_map_add(_map,"best_time_level_3_2",global.stat_time_lvl_3_2);
	ds_map_add(_map,"best_time_level_3_3",global.stat_time_lvl_3_3);
	ds_map_add(_map,"best_time_level_3_4",global.stat_time_lvl_3_4);
	ds_map_add(_map,"best_time_level_3_5",global.stat_time_lvl_3_5);
	ds_map_add(_map,"best_time_level_3_6",global.stat_time_lvl_3_6);
	ds_map_add(_map,"best_time_level_3_7",global.stat_time_lvl_3_7);
	ds_map_add(_map,"best_time_level_3_8",global.stat_time_lvl_3_8);
	ds_map_add(_map,"best_time_level_3_9",global.stat_time_lvl_3_9);



	//Wrap the root list in a map 
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper,"ROOT_FILE",_root_list);


	//Save all to string
	var _string = json_encode(_wrapper);
	SaveStringToFile("fusion_shift_gamesave.game",_string);

	//Nuke the data
	ds_map_destroy(_wrapper);

	if (global.myDebug ) show_debug_message("Gane saved!");


}

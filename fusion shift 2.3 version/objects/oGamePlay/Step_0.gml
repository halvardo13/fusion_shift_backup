//Pause Menu
if ((keyboard_check_pressed(vk_escape)) or (gamepad_button_check_pressed(global.controller_device,gp_start))) {
	global.game_pause = !global.game_pause;
}

if (layer_exists("Water")) {
	var layerID = layer_background_get_id("Water");
	layer_background_speed(layerID,4*global.time);

}

//Gamemode failsafe
if (room != rMenu) and (room != rSpace) and (global.gameMode != "score") and (oTransition.percent == 0) {
	global.gameMode = "level";
}

//Hardcore timer
if (global.hardcore_mode == true) and (room != rMenu) and (room != rSpace) {
	if (global.game_pause == false) global.hardcore_mode_timer += 1;



}


if (global.gameMode == "score") UpdateAchievementList();


if (global.game_pause == true) and (room != rMenu) and (oTransition.percent == 0) {
	//Courser
	if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(vk_up)) or (gamepad_button_check_pressed(global.controller_device,gp_padu)) {
		mainCourser -= 1; 
		opCourser -= 1;
	}
	if (keyboard_check_pressed(ord("S"))) or (keyboard_check_pressed(vk_down)) or (gamepad_button_check_pressed(global.controller_device,gp_padd)) {
		mainCourser += 1; 
		opCourser += 1;
	}
	
	//Mouse input
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui > menu_y) and (mouse_y_gui < menu_bottom) {
		//mainCourser = ((menu_y-(menu_font_heigth*2)) + mouse_y_gui) div (menu_font_heigth * 1.5);
	
	}
	//Clamp
	switch (menu_set) {
		//Main
		case 0:
		if (mainCourser > mainItems) mainCourser = 0;
		if (mainCourser < 0) mainCourser = mainItems;
		menu_bottom = menu_y + ((menu_font_heigth * 1.5) * (mainItems+1));
		break;
		//Options
		case 1:
		if (opCourser > opItems) opCourser = 0;
		if (opCourser < 0) opCourser = opItems;
		break;
	}
	//Execute
	if (keyboard_check_pressed(vk_space)) or (gamepad_button_check_pressed(global.controller_device,gp_face1)) and (oCamera.blackbar_size == 0) and (room != rMenu) and (room != rSpace) and (fail_state == false) {
		switch(menu_set) {
			case 0:
			//Main Menu
			switch (mainCourser) {
				//Resume Game
				case 0:
					global.game_pause = false;
		
				break
				//exit to menu
				case 1:
					global.gameMode = "noone";
					SlideTransition(t_mode.goto,rMenu);
					global.game_pause = false;
					
					if (global.hardcore_mode == true) {
						global.hardcore_mode_timer = 0;	
						
						global.hardcore_mode = false;
					}
				break;
				//Exit to desktop
				case 2:
					global.gameMode = "noone";
					with (oSaveLoad) enter_save_state = true;
					SlideTransition(t_mode.endgame,noone);
					global.game_pause = false;
				break;
			}
			break;
			case 1:
				//Options
				switch(opCourser) {
					//Toggle fullscreen
					case 0:
					window_set_fullscreen(!window_get_fullscreen());
			
					break;	
					//Back
					case 1:
					menu_set = 0;
	
					mainCourser = 0;
					opCourser = 0;	
					break;
			
				}
			break;
		}
	}
}

//Gamepad connected
if (gamepad_is_connected(global.controller_device)) {
	if (gamepad_connected == false) show_debug_message("gamepad connected!");
	gamepad_connected = true;
}
else {
	if (gamepad_connected == true) show_debug_message("gamepad disconnected!");
	gamepad_connected = false;
}


//Count enemies
global.enemyCount = instance_number(pEnemy);


//Fail State
level_end_check_marg = max(level_end_check_marg - 1,0);
if (fail_state == true) and (level_end_check_marg <= 0) {
	if (oPlayer.hp_show != 0) audio_play_sound(sfx_level_fail_1,0,0);
	oPlayer.hp_show = 0;
	//Set highscore
	if (global.gameMode == "score") {
		if (global.scr > global.high_scr) {
			global.high_scr = global.scr;
			new_highscore = true;
			
			UpdateAchievementList();
		}
		with (oEndlessController) {
			current_spawn_set = 375;
			portal_timer = timer_reset;	
		}
	}
	//Delete enemies
	//var eCount = instance_number(pEnemy) {
	//	for (var i = 0;i <= eCount;i++) {	
	//		//with (instance_nearest(x,y,pEnemy)) instance_destroy();
			
	//	}
	//}
	
	//Restart
	var hold_restart = false;
	if (global.gameMode == "score") {
		if (gauntlet_hold_restart == true) hold_restart = true;
		else hold_restart = false;
	}
	var goto_menu = false;
	if (keyboard_check_pressed(ord("Q"))) {
		hold_restart = false;	
		var goto_menu = true;
	}
	if (keyboard_check_pressed(vk_space)) hold_restart = false;
	if (reset_level_timer <= 0) and (hold_restart == false) /*or (keyboard_check_pressed(ord("R")) or (gamepad_button_check_pressed(global.controller_device,gp_face1)))*/ {
		if (oPlayer.no_input == true) global.stat_total_deaths += 1;
		with (oPlayer) no_input = false; stop_draw = true;
		playerXFailState = 0;
		global.enemyCount = 0;
		global.scr = 0;
		new_highscore = false;
		comboCount = 0;
		combo5 = 0;
		fail_state = false;
		reset_level_timer = reset_level_timer_set;
		level_end_check_marg = level_end_check_marg_set;
		
		
		if (global.gameMode != "score") {
			if (global.hardcore_mode == false) {
				SlideTransition(t_mode.restart,noone);
			}
			else {
				global.gameMode = "noone";
				global.hardcore_mode = false;
				
				
				//Record time 
				global.hardcore_mode_timer = 0;

				
				lc_shake = true;
				levelComplete = false;
				lc_scale = 6;
				lc_scaleX = 6;
				lc_alpha = 1.6;
				lc_angle = 24;
				lc_angle2 = -16;
		
		
				if (instance_exists(oCamera)) oCamera.blackbar_size = 0;
				
				SlideTransition(t_mode.goto,rMenu);
			}
		}
		else {
			if (goto_menu == false) {
				goto_gauntlet = true;
				SlideTransition(t_mode.goto,rMenu);	
			}
			else {
				goto_gauntlet = false;
				SlideTransition(t_mode.goto,rMenu);
			}
		}
	}
	
	gauntlet_hold_restart = true;
	reset_level_timer = max(reset_level_timer - 1,0);
	//Death effect
	with (oPlayer) {
		var WaveStrenght = 1.65;
		var WaveTime = 0.175;
		if (other.reset_level_timer > 25) x = Wave(other.playerXFailState-WaveStrenght,other.playerXFailState+WaveStrenght,WaveTime,0);
		
		var _max = 2.1;
		image_xscale = Approach(image_xscale,_max,0.05);
		image_yscale = Approach(image_yscale,_max,0.05);
		if (image_xscale == _max) or (image_yscale == _max) {
			stop_draw = true;
			
		}
		else ScreenShake(1.25,30);
		//Particles
		var check = _max - 0.05;
		if (image_xscale == check-0.05) or (image_yscale == check - 0.05) {
			ScreenShake(1.25,30);
			var rep = irandom_range(13,15);
			repeat(rep) {
				with (instance_create_layer(x,y,"Bullets",oOnePixel)) {
					direction = random_range(0,360);
					spd = random_range(-1.6,2.4);
					col = make_color_hsv(220,35,50);
					
					image_yscale = random_range(2,4);
					image_xscale = random_range(2,4);
				}
			}
		}
	}
	
}
else reset_level_timer = reset_level_timer_set;

//Screen flash 
screen_flash = max(screen_flash - 0.05,0);

//Combo
if (comboAdd == true) {
	comboPercent = comboSet;
	comboCount += 1;
	combo5 += 1;
	comboScale = 1.5;
	with (oPlayer) {
		if (other.combo5 == 5) {
			hp_add = true;
	
		}
	}
	if (combo5 >= 5) combo5 = 0;
	
	comboAdd = false;
}
//End Combo
if (global.time == 1) and (global.game_pause == false) comboPercent = max(comboPercent - 0.005,0);
if (comboPercent <= 0) {
	comboCount = 0;
	combo5 = 0;
	
}
comboScale = max(comboScale - 0.05,1);


//Fullscreen toggle
if (keyboard_check(vk_control)) {
	if (keyboard_check_pressed(ord("F"))) {
		window_set_fullscreen(!window_get_fullscreen());
	}
}
if (gamepad_button_check_released(global.controller_device,gp_stickl)) {
	window_set_fullscreen(!window_get_fullscreen());
}


//My debug toggle
if (keyboard_check_pressed(vk_f1)) {
	global.myDebug = !global.myDebug;	
	
	show_debug_message("myDebug: "+string(global.myDebug));
}

//Spawn helicopter
if (global.spawnerCount < 2) and (room != rMenu) and (global.gameMode == "score") {
	spawnerBuff = max(spawnerBuff - 1,0);
	if (spawnerBuff <= 0) {
	
		//with (instance_create_layer(room_width/2,45,"Other",oSpawner)) {
		//	spawnRate = spawnRateSet;
		
		//}
		spawnerBuff = spawnerBuffSet;
	}
	
}
else spawnerBuff = spawnerBuffSet;

//Start level
if (start_level == true) {
	levelTimer = 0;
	
}
		
//End completed level
if (global.gameMode = "level") and (oTransition.percent == 0) {
	if (global.enemyCount <= 0) {
		if (fail_state == false) {
			if (oCamera.blackbar_size == 8) {
				audio_play_sound(sfx_level_complete,0,0);	
				//Set stats
				with (oProgression) {
					set_stat = true;
					level = room;
			
				}	
				GameProgress(room);
				
				UpdateAchievementList();
				
			}
			levelComplete = true;
			var target = 2;
			var spd_ = 0.25;
			var angle_spd = 1.25;
			lc_scale = Approach(lc_scale,target,spd_);
			if (lc_scale != target) lc_scaleX = Approach(lc_scaleX,target,spd_);
			else {
				if (lc_shake == true) ScreenShake(0.75,30);
				lc_shake = false;
				
				lc_scaleX = Approach(lc_scaleX,4,0.15);
				lc_alpha = Approach(lc_alpha,0,0.0035);
				lc_angle2 = Approach(lc_angle2,0,1);
			}
			
			
			lc_alpha = Approach(lc_alpha,0,0.05);
			lc_angle = Approach(lc_angle,0,angle_spd);
			
			if (instance_exists(oCamera)) oCamera.blackbar_size = Approach(oCamera.blackbar_size,112,8);
		}
		
	}
	else {
		lc_shake = true;
		levelComplete = false;
		lc_scale = 6;
		lc_scaleX = 6;
		lc_alpha = 1.6;
		lc_angle = 24;
		lc_angle2 = -16;
		
		
		if (instance_exists(oCamera)) oCamera.blackbar_size = 0;
	}
}		

//Goto next level
if (lc_alpha <= 0) and (global.game_pause == false) {
	if (room != rmLvl_3_9) {
		//Normal next level
		if (keyboard_check_pressed(vk_space)) or (gamepad_button_check_pressed(global.controller_device,gp_face1)) SlideTransition(t_mode.next,noone);
	}
	else {
		//Ending
		if (keyboard_check_pressed(vk_space)) or (gamepad_button_check_pressed(global.controller_device,gp_face1)) {
			if (global.game_complete == false) {
				//Normal goto ending
				global.game_complete = true;
				global.gameMode = "noone";	
				SlideTransition(t_mode.goto,rSpace);
				lc_shake = true;
				levelComplete = false;
				lc_scale = 6;
				lc_scaleX = 6;
				lc_alpha = 1.6;
				lc_angle = 24;
				lc_angle2 = -16;
		
		
				if (instance_exists(oCamera)) oCamera.blackbar_size = 0;
			}
			else {
				if (global.hardcore_mode == false) {
					//Goto menu ending
					global.gameMode = "noone";	
					SlideTransition(t_mode.goto,rMenu);
				}
				
				
				if (global.hardcore_mode_timer != 0) {
					//Goto hardcore mode ending
					global.gameMode = "noone";	
					SlideTransition(t_mode.goto,rSpace);
				}
			
				lc_shake = true;
				levelComplete = false;
				lc_scale = 6;
				lc_scaleX = 6;
				lc_alpha = 1.6;
				lc_angle = 24;
				lc_angle2 = -16;
		
		
				if (instance_exists(oCamera)) oCamera.blackbar_size = 0;		
			}
		}
	}
}

//Enable invs 
//if (keyboard_check_pressed(vk_f2)) {
//	global.player_invs = !global.player_invs;
//	player_invs_alpha = 5;
//}


//Timer
if (global.gameMode == "level") and (global.game_pause == false) {
	if (global.enemyCount > 0) levelTimer += 1;
}

//Screenshot
if (keyboard_check_pressed(vk_f3)) /*and (keyboard_check(vk_control))*/ {
	
	screen_save(working_directory + "Screenshot" + string(num++) + ".png")
	show_debug_message("Screenshot");
}

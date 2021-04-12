//Input + Menu Courser
var execute_key = vk_space;
var courser_up = (keyboard_check(ord("W"))) or (keyboard_check_pressed(vk_up)) or (gamepad_button_check_pressed(global.controller_device,gp_padu));
var courser_down = (keyboard_check(ord("S"))) or (keyboard_check_pressed(vk_down)) or (gamepad_button_check_pressed(global.controller_device,gp_padd));
var key_press = courser_up - courser_down;


if (rebind == true) {
	courser_down = 0;
	courser_up = 0;
	
}
if (rebind == false) and (oTransition.percent == 0) and (!instance_exists(oGameStartup)) {
	//Courser UP
	if (courser_up) and (key_press != 0) {
			input_buffer--;
			if (input_buffer <= 0) {
				menu_courser -= 1; 
				
				//Set input buffer
				input_buffer = input_buffer_reset;
				input_buffer_reset = input_buffer_reset * input_buffer_percent;
				input_buffer_reset = clamp(input_buffer_reset,input_buffer_min,input_buffer_max);
				
				//Play SFX
				audio_play_sound(sfx_menu_move_courser,0,0);
				
				//Destroy text
				if (instance_exists(oTextBox)) instance_destroy(oTextBox);
			}
	}
	//Courser DOWN
	if (courser_down) and (key_press != 0) {
			input_buffer--;
			if (input_buffer <= 0) {
				menu_courser += 1; 
				
				//Set input buffer
				input_buffer = input_buffer_reset;
				input_buffer_reset = input_buffer_reset * input_buffer_percent;
				input_buffer_reset = clamp(input_buffer_reset,input_buffer_min,input_buffer_max);
				
				//Play SFX
				audio_play_sound(sfx_menu_move_courser,0,0);
				
				//Destroy text
				if (instance_exists(oTextBox)) instance_destroy(oTextBox);
			}
	}
}
//Reset input_buffer if no keys are held
if (key_press == 0) {
	input_buffer = 0;
	input_buffer_reset = input_buffer_max;
}


//Clamp Courser 
if (menu_courser < 1) menu_courser = menu_entry[page,0];
if (menu_courser > menu_entry[page,0]) menu_courser = 1;



if (oGamePlay.goto_gauntlet == true) {
	page = 11;	
	menu_courser = 1;
	
	oGamePlay.goto_gauntlet = false;
	with (oEndlessController) enter_warp = true;
}

//Select and execute
if (keyboard_check_pressed(execute_key)) and (oTransition.percent == 0 ) and (!instance_exists(oGameStartup)) {
	audio_play_sound(sfx_menu_enter,0,0);
	switch(page) {
		//PAGE 0
		case 0: 
			switch(menu_courser) {
				//Goto page 1
				case 1: 
					if (file_exists("fusion_shift_gamesave.game")) {
						with (oSaveLoad) enter_load_state = true;
						page = 1;
					}
					else {
						//with (oSaveLoad) enter_save_state = true;
						//page = 1;	
					}
				break;
				//End Game
				case 2:
					with (oSaveLoad) enter_save_state = true;
					SlideTransition(t_mode.endgame,noone);
				break;
			}
		break;
		//PAGE 1
		case 1:
			switch(menu_courser) {
				//Goto world 1
				case 1:	
					page = 2;
				break;
				//Goto world 2
				case 2:	
					page = 3;
					menu_courser = 1;
				break;	
				//Goto world 3
				case 3:	
					page = 4;
					menu_courser = 1;
				break;
				//Goto Gauntlet
				case 4:	
					page = 11;
					with (oEndlessController) enter_warp = true;
				break;
				//Hardcore mode
				case 5:
					if (global.game_complete == true) {
						global.hardcore_mode = true;
						LevelStart(t_mode.goto,rmLvl_1_1,"level");
						
					}
				break;
				//Goto Settings
				case 6:
					menu_courser = 1;
					page = 5;
				break;
				//Goto profile
				case 7:
					menu_courser = 1;
					page = 10;
				break;
				//Back
				case 8:
					page = 0;
					menu_courser = 1;
				break;
			}
		break;
		//PAGE 2 - world 1
		case 2:
			World_1();
			global.hardcore_mode = false;
			global.hardcore_mode_timer = 0;
		break;
		//PAGE 3 - world 2
		case 3:
			World_2();
			global.hardcore_mode = false;
			global.hardcore_mode_timer = 0;
		break;
		//PAGE 4 - world 3
		case 4:
			World_3();
			global.hardcore_mode = false;
			global.hardcore_mode_timer = 0;
		break;
		//PAGE 5 - settings
		case 5:
			switch(menu_courser) { 
				//Controls
				case 1:
					page = 6;
					menu_courser = 1;
				break;
				//Display
				case 2:
					page = 7;
					menu_courser = 1;
				break;		
				//Audio
				case 3:
					page = 8;
					menu_courser = 1;
				break
				//Credits
				case 4:
					page = 9;
					menu_courser = 1;
				break
				//Back
				case 5:
					page = 1;
					menu_courser = 6;
				break;

			}
		break;
		//PAGE 6 - controls remapping
		case 6:
		if (rebind == false) {
			switch(menu_courser) {
				//Remap UP
				case 1:
					rebind = true;
					keyboard_lastkey = -1;
				break;
				//Remap LEFT
				case 2:
					rebind = true;
					keyboard_lastkey = -1;
				break;	
				//Remap DOWN
				case 3:
					rebind = true;
					keyboard_lastkey = -1;
				break;				
				//Remap RIGHT
				case 4:
					rebind = true;
					keyboard_lastkey = -1;
				break;					
				//Remap JUMP/STOP TIME
				case 5:
					rebind = true;
					keyboard_lastkey = -1;
				break;						
				//Remap TAKE OVER
				case 6:
					rebind = true;
					keyboard_lastkey = -1;
				break;						
				//RESET 
				case 7:
					global.c_up = ord("W");
					global.c_down = ord("S");
					global.c_left = ord("A");
					global.c_right = ord("D");

					global.c_jump = vk_space;
					global.c_take_over = vk_lshift;
				break;
				//Go Back
				case 8:
					page = 5;
					menu_courser = 1;
					
					with (oSaveLoad) enter_save_state = true;
				break;
				}
			}
		break;
		//PAGE 7 - Display
		case 7:
			switch(menu_courser) {
				//Toggle fullscreen
				case 1:
					window_set_fullscreen(!window_get_fullscreen());
				break;
				//Back
				case 2:
					page = 5;
					menu_courser = 2;
					
					with (oSaveLoad) enter_save_state = true;
				break;
			}
		break;
		//PAGE 8 - Aduio
		case 8:
			switch(menu_courser) {
				//SFX
				case 1:
					//line 320
				break;
				//MUSIC
				case 2:
					//line 320
				break;
				//Back
				case 3:
					page = 5;
					menu_courser = 3;
					
					with (oSaveLoad) enter_save_state = true;
				break;
			}
		break;
		//Page 9 - Credits
		case 9:
			switch(menu_courser) {
				//Back
				case 1:
					page = 5;
					menu_courser = 4;
				break;
			}
		break;
		//Page 10 - profile
		case 10:
			switch (menu_courser) {
				//Stats
				case 1:
					
					
				break;
				//Back 
				case 2:
					page = 1;	
					menu_courser = 7;
				break;
			}
		break;
	}
}




//Rebind
if (rebind == true) {
	rebind_alpha = Wave(0.2,0.8,4,0);
	//rebind_scale = Wave(text_scale,(text_scale*1.1),1.5,0);
	switch (menu_courser) {
		//UP
		case 1:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_up = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;
		//LEFT
		case 2:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_left = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;	
		//DOWN
		case 3:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_down = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;		
		//RIGHT
		case 4:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_right = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;	
		//JUMP/STOP TIME
		case 5:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_jump = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;	
		//TAKE OVER
		case 6:
			if (keyboard_lastkey != -1) {
				key_map = keyboard_lastkey;
				global.c_take_over = key_map;
				
				key_map = -1;
				rebind = false;
			}
		break;
		
	}
}
else {
	rebind_alpha = 1;
	rebind_scale = text_scale;
}

//Update button remapping
if (page == 6) {
	menu_entry[6,1] = "Button Up: " +string(oGamePlay.key[global.c_up]);
	menu_entry[6,2] = "Button Left: " +string(oGamePlay.key[global.c_left]);
	menu_entry[6,3] = "Button Down: " +string(oGamePlay.key[global.c_down]);
	menu_entry[6,4] = "Button Right: " +string(oGamePlay.key[global.c_right]);
	menu_entry[6,5] = "Jump/Stop time: " +string(oGamePlay.key[global.c_jump]);
	menu_entry[6,6] = "Take over: " +string(oGamePlay.key[global.c_take_over]);
}

//Change audio gain
if (page == 8) {
	switch(menu_courser) {
		//Change sfx gain
		case 1:
		if (keyboard_check_pressed(ord("A"))) {
			global.gain_SFX -= 1;
			audio_play_sound(sfx_menu_move_courser,1,0);
		}
		if (keyboard_check_pressed(ord("D"))) {
			global.gain_SFX += 1;
			audio_play_sound(sfx_menu_move_courser,1,0);
		}
		
		global.gain_SFX = clamp(global.gain_SFX,0,10);
		break;
		//Change music gain
		case 2:
		if (keyboard_check_pressed(ord("A"))) {
			global.gain_MUSIC -= 1;
			audio_play_sound(sfx_music_audio_check,1,0);
		}
		if (keyboard_check_pressed(ord("D"))) {
			global.gain_MUSIC += 1;
			audio_play_sound(sfx_music_audio_check,1,0);
		}
		global.gain_MUSIC = clamp(global.gain_MUSIC,0,10);
		break;
	}
}

global.SFX_gain = global.gain_SFX / 10;
global.MUSIC_gain = global.gain_MUSIC / 10;

/*

//Text box
if (page == 1) {
	switch(menu_courser) {
		case 1:
		//World 1
		if (!instance_exists(oTextBox)) {
			with (instance_create_layer(x,y,"RunGame",oTextBox)) {
				text = "Hello hello!! test test\nsecond line!";
				length = string_length(text);	
			}	
		}
		break;
	}
}
else {
	//Destroy text
	if (instance_exists(oTextBox)) instance_destroy(oTextBox);	
	
}
*/




//Logo Disolve
logoDissolve = Approach(logoDissolve,1,0.01);


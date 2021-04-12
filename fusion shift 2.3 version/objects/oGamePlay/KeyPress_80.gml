if (room == rMenu) exit;

/// @desc Game/room restart
if (keyboard_check(vk_control)) {
	game_restart();
	show_debug_message("Game Restart");	
}
else {
	SlideTransition(t_mode.restart,noone);
	show_debug_message("Room Restart");	
	
		global.scr = 0;
		comboCount = 0;
		combo5 = 0;
		fail_state = false;
		
		fail_state = true;
		reset_level_timer = 0;
}

current_alpha += spd;
if (current_alpha > alpha_tic) {
	current_alpha = current_alpha_set;
	current_text++;
}
if (current_text == text_last) {
	if (global.hardcore_mode == true) {
		global.hardcore_mode = false;
		global.hardcore_mode_timer = 0;
	}
	SlideTransition(t_mode.goto,rMenu);
}

global.game_pause = false;
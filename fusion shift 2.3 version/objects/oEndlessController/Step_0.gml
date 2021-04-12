if (oGamePlay.fail_state == false) and (enter_warp == true) {
	//Animation
	alpha_ = Approach(alpha_,alpha_max,0.002);
	sub_++;
	if (sub_ > 5) {
		subimg += animation_spd;
		sub_ = 0;
	}
	if (subimg > 8) subimg = 0;
	
	
	
	if (enter_warp == true) {
		if (instance_exists(pEnemy)) {
			with (pEnemy) {	
				killed_by = "spawner";
			
				instance_destroy();
			}
		}
		reset = true;
		
		//Warp Timer
		warp_timer++;
		if (warp_timer >= refresh) and (goto_level == false) {
			//Refresh
			refresh = refresh_set;
			refresh_set = refresh_set * 1.05;
			
			//Choose level
			warp_choose = irandom_range(0,warp_max);
			if (warp_list[warp_choose,1] == room) warp_choose =  irandom_range(0,warp_max);
			
			//Goto level
			if (refresh_set > 120) {
				goto_level = true;
				
				refresh_set = 15;
				refresh = refresh_set;

				refresh_reset = refresh;
			}
		}
		
		//Dot timer
		dot_timer = Approach(dot_timer,dot_timer_max,1);
		if (dot_timer == dot_timer_max) dot_timer = 0;
		
		//Goto level
		if (goto_level == true) {
			goto_level_timer--;
			if (goto_level_timer <= 0) {
				enter_warp = false;	
				LevelStart(t_mode.goto,warp_list[warp_choose,1],"score");
				
			}
		}
	}

}
else {
	reset = true;	
	enter_warp = false;
}

//Reset
if (enter_warp == false) and (reset == true) {
	enter_warp = false;
	dot_timer_max = 120;
	dot_timer = 0;
	
	alpha_ = 0;
	sub_ = 0;
	subimg = 0;
	
	warp_timer_set = 120;

	goto_level = false;
	goto_level_timer_set = 90;
	goto_level_timer = goto_level_timer_set;

	warp_timer = 0;
	refresh_set = 15;
	refresh = refresh_set;

	refresh_reset = refresh;

	warp_choose = 0;
	
	
	reset = false;
}

//Difficulty
if (increase_difficulty == true) {
	current_spawn_set = current_spawn_set * 0.95;
	portal_timer = portal_timer * 1.05;
	
	current_spawn_set = clamp(current_spawn_set,100,10000000);
	increase_difficulty = false;
}



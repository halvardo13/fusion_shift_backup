function TakeOverEnemy() {
	EnemySheild();

	//Get tagged
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,global.enemyTakeOverRange)) {
		if (oPlayer.target == false) and (sheild == false) {
			tagged = true;	
			//Activate
			if (keyboard_check_pressed(global.c_take_over)) or (gamepad_button_check_pressed(global.controller_device,gp_face4)) {
				oPlayer.target = true;	
				controled = true;
				hp_bar_alpha = hp_bar_alpha_set;
			
				with (myGun) fRate = 0;
			
				//Effects
				take_over_effect_scale = 0.8;
				take_over_effect_alpha = 1.25;
			
			
			
			}
		}
	}
	else tagged = false;


}

var destroy = false;
with (other) {
	//Enemy that is controled
	if (controled == true) {
		if (oPlayer.invs_frames == 0) {
			grv_change = grv_change * 0.95;
			vsp = -1.2/grv_change;	
			flash = 1.4;	
			hp_bar_alpha = hp_bar_alpha_set;
			var destroy = true;
			
		}
		
		//Player Damage
		with (oPlayer) {
			if (invs_frames == 0) {	
				//grv_change = grv_change * 0.95;
				//vsp = -0.2/grv_change;	
				invs_frames = invs_set;
				
				hp_bar_shake = hp_bar_shake_set;
			}
		}
	}
}
if (destroy == true) instance_destroy();


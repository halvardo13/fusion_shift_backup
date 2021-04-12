var destroy = false;
with (other) {
	//Enemy that is controled
	if (controled == true) {
		if (oPlayer.invs_frames == 0) {
			hp -= other.damage;
			flash = 1.4;	
			hp_bar_alpha = hp_bar_alpha_set;
			var destroy = true;
			
		}
		
		//Player Damage
		with (oPlayer) {
			if (invs_frames == 0) {	
				hp -= 1;
				invs_frames = invs_set;
				
				hp_bar_shake = hp_bar_shake_set;
			}
		}
	}
}
if (damage_timer <= 0) and (sprite_index != sCactusBroken) {
	with (other) {	
		hp -= 15;
		flash = 1.4;
		hp_bar_alpha = hp_bar_alpha_set;
	}
	damage_timer = damage_timer_set;
}
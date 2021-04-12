if (other.sprite_index == sMarsMonster) exit;


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


var destroy = false;
with (other) {
	hit_from = other.direction;
	if (controled == false) {
		hp -= other.damage;
		hp_bar_alpha = hp_bar_alpha_set;
	
		flash = 1.2;	
		
		var destroy = true;
	}
}
if (destroy == true) {	
	//if (is_enemy == true) {
	//	var rep = irandom_range(2,5);
	//	repeat(rep) {
	//		with (instance_create_layer(x,y,"Other",oBloodEffect)) {	
	//			direction = other.direction - 180+random_range(-32,32);
	//			spd = random_range(1,1.6);
		
	
	//		}
	//	}
	//}
	
}
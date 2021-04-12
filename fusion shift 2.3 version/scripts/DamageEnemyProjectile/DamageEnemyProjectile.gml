function DamageEnemyProjectile() {
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
		instance_destroy();
	}


}

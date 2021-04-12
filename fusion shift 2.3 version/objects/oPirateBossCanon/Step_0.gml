if (global.game_pause == true) or (global.timeStop == true) {

	exit;
}

PirateBossWave(5,1.35);


if (instance_exists(oPirateBoss)) {
	var healthPercentarge = ((oPirateBoss.hp / oPirateBoss.hp_max));
	healthPercentarge = 1;
	
	if (healthPercentarge <= 75) healthPercentarge = clamp(healthPercentarge,0.95,1);
	if (healthPercentarge <= 50) healthPercentarge = clamp(healthPercentarge,0.85,1);
	if (healthPercentarge <= 25) healthPercentarge = clamp(healthPercentarge,0.80,1);
}
else exit;


//Shoot
switch(attack_mode) {
	//normal 
	case "normal":
	if (oPirateBoss.bomb_attack == true) {
		attack_mode = "shoot_up";
	}
	var dir = point_direction(x,y,target.x,target.y);
	image_angle = dir;
	timeout_timer = max(timeout_timer - 1,0);
	fRate = max(fRate - 1,0);
	if (fRate <= 0) and (timeout_timer <= 0) and (instance_exists(oPirateBoss)) {
		audio_play_sound(sfx_pirate_canon,-1,0);
		with (instance_create_layer(x,y,"Bullets",oPirateBossBullet)) {
			direction = dir;
			image_angle = dir;
			
			mySpd = random_range(1.3,1.85);
			damage = other.target_damage;
		}
	
		fRate = (random_range(75,125) * healthPercentarge);	
		if (Chance(timeout_chance)) timeout_timer = random_range(timeout_timer_set - 5,timeout_timer_set+5);
	
		//Dust
		repeat(8) {
			var xx = x + lengthdir_x(8, dir);
			var yy = y + lengthdir_y(8, dir);
			with (instance_create_layer(xx,yy,"Bullets",oDust)) {
		
				direction = 90+irandom_range(-25,25);
				spd = random_range(0.2,0.8);
				alpha_spd = 0.02;
			}
		}
	}
	break;
	#region//shoot_up
	case "shoot_up":
	image_angle = Approach(image_angle,90,1.5);
	if (image_angle == 90) {
		shoot_up_fRate = max(shoot_up_fRate - 1,0);
		if (shoot_up_fRate <= 0) {
			with (instance_create_layer(x,y,"Bullets",oPirateBossBullet)) {
				direction = 90;
				image_angle = 90;
			
				mySpd = random_range(1.3,1.85);
				damage = other.target_damage;
		}
			var xx = x + lengthdir_x(8, 90);
			var yy = y + lengthdir_y(8, 90);
			with (instance_create_layer(xx,yy,"Bullets",oDust)) {
		
				direction = 90+irandom_range(-25,25);
				spd = random_range(0.2,0.8);
				alpha_spd = 0.02;
			}
			shoot_up_fRate = shoot_up_fRate_set + irandom_range(10,15);	
		}
	
	}
	shoot_up_timer = max(shoot_up_timer - 1,0);
	if (shoot_up_timer <= 0) {
		shoot_up_timer = shoot_up_timer_set;
	
		attack_mode = "normal";
		oPirateBoss.bomb_attack = false;
		oPirateBoss.bullet_defence = false;
		
		if (instance_exists(oPirateBossSheild)) instance_destroy(oPirateBossSheild);
	}
	break;
	#endregion
}












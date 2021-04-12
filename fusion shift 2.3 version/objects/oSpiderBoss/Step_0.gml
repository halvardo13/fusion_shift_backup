if (global.game_pause == true) or (global.timeStop == true) {
	exit;	
	
}

//Forcefield
var dir = point_direction(x,y - 16,oPlayer.x,oPlayer.y);
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,force_field_radius)) {
	oPlayer.x += lengthdir_x(force_field_strength,dir);
	oPlayer.y += lengthdir_y(force_field_strength,dir);
	force_field_strength = Approach(force_field_strength,force_field_strength_max,0.05);
	force_field_alpha = 1.15;
}
else {
	force_field_strength = force_field_strength_min;
	force_field_alpha = Approach(force_field_alpha,0,0.065);	
}


//State Machine
switch(attack) {
	//Idle
	case "idle":
		idle_timer = max(idle_timer - 1,0);
		if (idle_timer <= 0) {
			idle_timer = idle_timer_set;	
			if (idle_timer) {
				attack = "normal_shoot";
			
			}
		}
	break;
	//Normal shoot
	case "normal_shoot":
		//Shoot
		fRateNormal = max(fRateNormal - 1,0);
		if (fRateNormal <= 0) {
			var dir = point_direction(x,y,oPlayer.x,oPlayer.y);
			with (instance_create_layer(x,y,"Bullets",oBulletSpider)) {
				direction = dir;
				image_angle = dir;
				
				mySpd = 1.5;
				damage = 25;
			
			}
			fRateNormal = fRateNormalSet;
		}	
		//Goto 360
		normalShootTimer = max(normalShootTimer - 1,0);
		if (normalShootTimer <= 0) {
			attack = "360_shoot";
			fRate360 = fRate360Set * 4;
			
			normalShootTimer = normalShootTimerSet;
		}
	break;
	//360 shoot
	case "360_shoot":
		//Shoot
		shoot_360_dir += 2.5;
		if (shoot_360_dir > 360) shoot_360_dir = 0;
		fRate360 = max(fRate360 - 1,0);
		if (fRate360 <= 0) {
			var rep = 8;
			repeat(rep) {
				if (rep == 8) var dir = 0 + shoot_360_dir;
				if (rep == 7) var dir = 45 + shoot_360_dir;
				if (rep == 6) var dir = 90 + shoot_360_dir;
				if (rep == 5) var dir = 135 + shoot_360_dir;
				if (rep == 4) var dir = 180 + shoot_360_dir;
				if (rep == 3) var dir = 225 + shoot_360_dir;
				if (rep == 2) var dir = 270 + shoot_360_dir;
				if (rep == 1) var dir = 315 + shoot_360_dir;
				
				with (instance_create_layer(x,y,"Bullets",oBulletSpider)) {
					direction = dir;
					image_angle = dir;
		
					mySpd = 1.5;
					damage = 25;
				}
				rep--;
			}
			fRate360 = fRate360Set;
		}
		//Goto idle
		timer360 = max(timer360 - 1,0);
		if (timer360 <= 0) {
			attack = "normal_shoot";
			fRateNormal = fRateNormalSet * 8;
			
			timer360 = timer360set;
		}
	break;

}

//HP
event_inherited();


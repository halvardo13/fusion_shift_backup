/// @desc Follow Owner
if (instance_exists(ownerID)) and (global.game_pause == false) {
	x = ownerID.x;
	y = ownerID.y;

}


if (global.timeStop == true) or (global.game_pause == true) exit;
switch(can_use) {
	//Can NOT use
	case false:
	//Destroy
	if (!instance_exists(ownerID)) {
		instance_destroy();
		
	}
	//Shoot
	if (ownerID.shoot == true) {
		var dir_to_player = point_direction(x,y,oPlayer.x,oPlayer.y);
		var dist_to_player = point_distance(x,y,oPlayer.x,oPlayer.y);
		var line_collison = collision_line(x,y,oPlayer.x,oPlayer.y,pCollision,false,true);
		
		image_angle = dir_to_player;
		if (image_angle == clamp(image_angle,90,270)) {
			image_yscale = -1;
			ownerID.image_xscale = -1;
		}
		else {
			image_yscale = 1; 
			ownerID.image_xscale = 1;
		}
	
		//Shoot
		fRate = max(fRate - 1,0);
		recoil = max(0,recoil - 1);
		if (!line_collison) and (fRate <= 0) and (dist_to_player <= range) {
			recoil = 4;
			EnemyGunSFX(sfx_shotgun_enemy);
			var bulletCount = 3;
			for (var i = 0;i <= bulletCount;i++) {
				with (instance_create_layer(x,y,"Bullets",oBulletEnemyShotgun)) {
					var r = random_range(-7,7);
					direction = dir_to_player+r;
					image_angle = dir_to_player;
			
					mySpd = 1.5;
					damage = 45;
				}
				fRate = fRateSetEnemy;
				bullet_flash = bullet_flash_set-2;
			
				//ScreenShake(1,0.075);
			}
		}
		//Recoil
		var dir_from_player = point_direction(oPlayer.x,oPlayer.y,x,y);
		x = x + lengthdir_x(recoil,dir_from_player);
		y = y + lengthdir_y(recoil,dir_from_player);	

	}
	break;
	
	//Can use
	case true:
	//Aim with mouse
	if (global.controller_use == 0) {
		var dir = point_direction(x,y,oCourser.x,oCourser.y);
	}
	else {
		//Aim with controller
		var controllerH = gamepad_axis_value(global.controller_device,gp_axisrh);
		var controllerV = gamepad_axis_value(global.controller_device,gp_axisrv);
		if (abs(controllerH) > 0.6) or (abs(controllerV) > 0.8) {
			global.controllerAngle = point_direction(0,0,controllerH,controllerV);
			
			with (oCourser) marg = Approach(marg,12,1);
		}
		else with (oCourser) marg = Approach(marg,0,2);
		var dir = global.controllerAngle;
	}
	
	
	image_angle = dir;
	if (image_angle == clamp(image_angle,90,270)) {
		image_yscale = -1;
		ownerID.xscale = -1;
		//ownerID.image_xscale = -1;
	}
	else {
		image_yscale = 1; 
		ownerID.xscale = 1;
		//ownerID.image_xscale = 1;
	}
	
	//Shoot
	fRate = max(fRate - 1,0);
	recoil = max(0,recoil - 1);
	if ((mouse_check_button(mb_left) or (gamepad_button_check(global.controller_device,gp_shoulderr)) or (gamepad_button_check(global.controller_device,gp_shoulderrb))) and (fRate <= 0)) {
		recoil = 8;
		audio_sound_pitch(sfx_shotgun_player,random_range(0.75,1.25));
		audio_play_sound(sfx_shotgun_player,0,0);		
		var bulletCount = 4;
		for (var i = 0;i <= bulletCount;i++) {
			with (instance_create_layer(x,y,"Bullets",oBulletShotgun)) {
				var r = random_range(-15,15);
				if (global.controller_use == 1) r = random_range(-0.2,0.2)
				direction = dir+r;
				image_angle = dir;
			
				mySpd = 5;
				damage = 25;
			}
		}
		fRate = fRateSetPlayer;
		bullet_flash = bullet_flash_set;
		
		ScreenShake(1,0.08);
		with (oCourser) scaleUp = 1.2;
	}
	//Recoil
	x = x - lengthdir_x(recoil,dir);
	y = y - lengthdir_y(recoil,dir);
	break;
}


















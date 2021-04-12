/// @desc Follow Owner
if (instance_exists(ownerID)) and (global.game_pause == false) {
	x = ownerID.x;
	y = ownerID.y;

}


if (global.timeStop == true) or (global.game_pause == true) exit;
switch(can_use) {
	#region//Can NOT use
	case false:
	image_index = 1;
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
			ownerID.xscale = -1;
		}
		else {
			image_yscale = 1; 
			ownerID.xscale = 1;
		}
	
		//Shoot
		fRate = max(fRate - 1,0);
		recoil = max(0,recoil - 1);
		
		if (fRate <= 25) hsp_aim = 0.2;
		else hsp_aim = 1;
		if (!line_collison) and (fRate <= 0) and (dist_to_player <= range) {
			recoil = 4;
			with (instance_create_layer(x,y,"Bullets",oArrowEnemy)) {
				direction = dir_to_player;
				image_angle = dir_to_player;
				
				POWER = 0.1;
				mySpd = 3;
				damage = global.damage_bow * 0.5;
			}
			fRate = fRateSetEnemy;
			bullet_flash = bullet_flash_set-2;
			
			//ScreenShake(1,0.075);
		}
		//Recoil
		var dir_from_player = point_direction(oPlayer.x,oPlayer.y,x,y);
		x = x + lengthdir_x(recoil,dir_from_player);
		y = y + lengthdir_y(recoil,dir_from_player);	

	}
	break;
	#endregion
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
	var progress = 1;
	var strengthShot = 0;
	//Hold
	if (fRate <= 0) {
		var progress = 1;
		var strengthShot = 0;
		if (holding == true) {
			
			
			var progress = (time_hold / time_to_hold);
			var strengthShot = (strength / time_to_hold);
			time_hold -= 0.5;
			strength += 0.5;
			progress = clamp(progress,0,1);
			strengthShot = clamp(strengthShot,0,1);
		
			//Get subimg
			if (progress == 1) image_index = 1; 
			if (progress <= 0.75) and (progress > 0.40) {
				image_index = 1;
				ScreenShake(0.05,0.2);
			}
			if (progress <= 0.40) and (progress > 0) {
				image_index = 2;
				ScreenShake(0.1,0.2);
			}
			if (strengthShot == clamp(strengthShot,0.98,0.99)) flash = 1.2;
			if (progress == 0) and (progress < 0.40) {
				image_index = 3; 
				ScreenShake(0.2,0.2);
			}
		
			with (ownerID) {
				hsp_aim = 1*progress;
				hsp_aim = clamp(hsp_aim,0.25,1);	
			}
			test = progress;
		}
		else {
			if (progress == 1) image_index = 0;
			audio_stop_sound(sfx_bow_holding);	
			
		}
		
		//Shoot
		if (mouse_check_button(mb_left) or (gamepad_button_check(global.controller_device,gp_shoulderr)) or (gamepad_button_check(global.controller_device,gp_shoulderrb))) {
			if (holding == false) //audio_play_sound(sfx_bow_holding,0,1);
			holding = true;
		}
		if (mouse_check_button_released(mb_left) or (gamepad_button_check_released(global.controller_device,gp_shoulderr)) or (gamepad_button_check_released(global.controller_device,gp_shoulderrb))) {
			//Cleanup
			image_index = 0;
			holding = false;
			time_hold = time_to_hold;
			strength = 0;
			with (ownerID) hsp_aim = 1;
		
			//Shoot
			//audio_sound_pitch(sfx_bow_release,random_range(0.8,1.2));
			audio_play_sound(sfx_bow_release,0,0);
			recoil = 4;
			fRate = fRateSetPlayer;
			with (instance_create_layer(x,y,"Bullets",oArrowPlayer)) {
				var spd_max = 6;
				var r = random_range(-1.4,1.4);
				if (global.controller_use == 1) r = random_range(-0.2,0.2)
				direction = dir+r;
				image_angle = dir;
			
				var powerstop = 0.05*progress;
			
				progress = clamp(progress,0.05,1);
				POWER = (0.1 + powerstop) * progress;
			
				var bonus = 3 * progress;
				mySpd = spd_max-bonus;
				mySpd = clamp(mySpd,1.25,spd_max); 
			
				strengthShot = clamp(strengthShot,0.25,1);
				damage = global.damage_bow*strengthShot;
			}
			fRate = fRateSetPlayer;
			bullet_flash = bullet_flash_set;
		
			ScreenShake(1.25,15);
			with (oCourser) scaleUp = 1.2;
		}
		//Recoil
		x = x - lengthdir_x(recoil,dir);
		y = y - lengthdir_y(recoil,dir);
	}
}
	















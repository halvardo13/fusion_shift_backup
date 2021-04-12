///@desc PlayerControl();
function PlayerControl() {


	//with (oGamePlay) hp_bar_alpha = Approach(hp_bar_alpha,1,0.1);
	//Input
	var key_right = keyboard_check(global.c_right);
	var key_left = keyboard_check(global.c_left);
	var key_jump = keyboard_check_pressed(global.c_jump) or keyboard_check_pressed(global.c_up);
	var key_hold_jump = keyboard_check(global.c_jump) or keyboard_check(global.c_up);

	if (key_right) or (key_left) or (key_jump) {
		global.controller_use = 0;

	}

	steam_get_user_steam_id()

	//Controller
	if (abs(gamepad_axis_value(global.controller_device,gp_axislh)) > 0.2) or (gamepad_button_check(global.controller_device,gp_face1)) or gamepad_button_check(global.controller_device,gp_shoulderlb) or gamepad_button_check(global.controller_device,gp_padl) or gamepad_button_check(global.controller_device,gp_padr) {
		var key_left = abs(min(gamepad_axis_value(global.controller_device,gp_axislh),0))  or (gamepad_button_check(global.controller_device,gp_padl));
		var key_right = max(gamepad_axis_value(global.controller_device,gp_axislh),0) or (gamepad_button_check(global.controller_device,gp_padr));
		var key_jump = gamepad_button_check_pressed(global.controller_device,gp_face1) or gamepad_button_check_pressed(global.controller_device,gp_shoulderlb);
		var key_hold_jump = gamepad_button_check(global.controller_device,gp_face1) or gamepad_button_check(global.controller_device,gp_shoulderlb);
	
		global.controller_use = 1;
	}

	var move = key_right - key_left;
							
	//Slide effect + acceleration
	if (move != 0) {
		if (move > 0) slide = slide_set;
		if (move < 0) slide = -slide_set;
	
		acRate += acRateSpd;
	}
	else acRate = 0;
	acRate = clamp(acRate,0,1);

	if (keyboard_check_released(global.c_left)) or (keyboard_check_released(global.c_right)) or (gamepad_button_check_released(global.controller_device,gp_padl)) or (gamepad_button_check_released(global.controller_device,gp_padr)) {
		hsp = 0;
		acRate = 0;
	}

	//Get movement
	hsp = ((move * spd)*acRate)*hsp_aim;
	if (sign(move == 0)) hsp += (slide*hsp_aim);
	slide = Approach(slide,0,0.05);

	EnemyGravityLine();

	//Normal jump
	if (key_jump) and (jumpBuff > 0) {
		vsp = -jumpHeight;
	
	#region//Jump particle
		var rep = 4;
		repeat(rep) {
			var angle = 15;
			var off = choose(-angle,angle);
			if (rep == 4) off = -angle;
			if (rep == 3) off = angle;
			off -= random_range(-15,15);
			with (instance_create_layer(x,bbox_bottom+2,"Bullets",oDust)) {
				spd = random_range(0.8,1);
				direction = 90+off;
			}
			rep -= 1;
		}
	#endregion
	
	}

	//Jump buffer
	if (key_jump) buffer_counter = buffer_max;

	if (buffer_counter > 0) {
		buffer_counter -= 1;
	
		if (onGround == true) {
			vsp = -jumpHeight;
			buffer_counter = 0;
		
		#region//Jump particle
		var rep = 4;
		repeat(rep) {
			var angle = 15;
			var off = choose(-angle,angle);
			if (rep == 4) off = -angle;
			if (rep == 3) off = angle;
			off -= random_range(-15,15);
			with (instance_create_layer(x,bbox_bottom+2,"Bullets",oDust)) {
				spd = random_range(0.8,1);
				direction = 90+off;
			}
			rep -= 1;
		}
	#endregion
		}
	}

	//Variable Jump height
	if (vsp < 0) and (!key_hold_jump) vsp = max(vsp,-jumpHeight/2);


	//Wind effect
	if (global.wind_effect == true) and (global.timeStop == false) and (onGround == false) {
		hsp = hsp - (global.wind_strenght);
	}

	//Footsteps
	footsteps_timer = max(footsteps_timer - 1,0);
	if (controled == true) and (onGround == true) and (footsteps_timer <= 0) and (hsp != 0) {
		var snd = sfx_player_footsteps_1;
		if (Chance(0.15)) var snd = sfx_player_footsteps_2;
	
		audio_play_sound(snd,-1,0);	
		footsteps_timer = footsteps_timer_set;
	}
	else {
		if (audio_is_playing(sfx_player_footsteps_1)) audio_stop_sound(sfx_player_footsteps_1);
		if (audio_is_playing(sfx_player_footsteps_2)) audio_stop_sound(sfx_player_footsteps_2);
	
	}


	//Sinkhole
	if (instance_exists(oSinkHole)) {
		if (place_meeting(x,y,oSinkHole)) {
			in_sinkhole = true;	
		}
		else in_sinkhole = false;
	}
	else in_sinkhole = false;

	//Horizontal Collision
	hsp_final = (hsp)+hsp_move;
	if (in_sinkhole == true) hsp_final = hsp_final * 0.1; 
	if (place_meeting(x+(hsp_final),y,pCollision)) {
		while (!place_meeting(x+(sign(hsp_final)),y,pCollision)) {
			x += sign(hsp_final);
		}
		hsp_final = 0;
	}
	x += hsp_final;

	hsp_move = Approach(hsp_move,0,0.045);


	//Vertical Collision
	vsp += vsp_move;
	if (place_meeting(x,y+(vsp),pCollision)) {
		while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;

	vsp = clamp(vsp,-100,max_down_vsp);
	vsp_move = Approach(vsp_move,0,0.5);
	onGround = place_meeting(x,y+1,pCollision);
	with (oPlayer) host_onGround = other.onGround;

	if (onGround == false) create_particle = true;
	if (onGround = true) {
		//Hit gorund particle
		if (create_particle == true) {
			var rep = 6;
			repeat(rep) {
				var angle = 65;
				var off = choose(-angle,angle);
				if (rep == 4) or (rep == 5) off = -angle;
				if (rep == 3) or (rep == 2) off = angle;
				off -= random_range(-15,15);
				with (instance_create_layer(x,bbox_bottom+2,"Bullets",oDust)) {
					spd = random_range(0.8,1);
					direction = 90+off;
				}
				create_particle = false;
				rep -= 1;
			}
		}
	
		//Jump Buff
		var jumpBuffSet = 8;
		jumpBuff = jumpBuffSet;
	}
	jumpBuff = max(jumpBuff - 1,0);
	var jumpBuffSet = 8;
	if (force_jump == true) {
		jumpBuff = jumpBuffSet;
		force_jump = false;
	}

	//Gun
	with (myGun) {
		can_use = true;	
	
	
	}

	//Make player follow
	with (oPlayer) {
		x = other.x;
		y = other.y-1;
	
		target = true;
	}

	//HP
	hp_fake = Approach(hp_fake,hp,0.55);
	with (oGamePlay) {
		hp_gui_max = other.hp_max;
		hp_gui_real = other.hp;
		hp_gui_fake = other.hp_fake;

	}

	//Release
	if (keyboard_check_pressed(global.c_take_over)) or (gamepad_button_check_pressed(global.controller_device,gp_face4))  or (hp <= 0) or (oGamePlay.fail_state == true) {
		//With oPlayer
		if (hp <= 0) {
			if (oPlayer.energy_current >= 35) {
				oPlayer.energy_current = 35;	
			}
		}
		oPlayer.host_onGround = false;
		oPlayer.jump_out_effect = true;
		oPlayer.pop_out = true;
		oPlayer.invs_frames = oPlayer.invs_set;
		oPlayer.target = false;
		//oPlayer.hp -= 1; 
	
		//Effects
		trown_out = true;
		controled = false;	
		tagged = false;
	
		//Trown
		vsp = -2.8;
		var zone = 0.25;
		if (hsp > zone) or (hsp < -zone) hsp = (hsp*1.8);
		else hsp = 0;
	
		if (oGamePlay.fail_state == false) audio_play_sound(sfx_throw_enemy,0,0);
	
		//Gun
		current_state = myState.fall;
		with (myGun) can_use = false;
		shoot = false;
	}









}

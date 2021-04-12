///@desc PlayerControl();
function PlayerControlJetpack() {

	//Input
	var key_right = keyboard_check(ord("D"));
	var key_left = keyboard_check(ord("A"));
	var key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
	var key_hold_jump = keyboard_check(vk_space) or keyboard_check(ord("W"));

	if (key_right) or (key_left) or (key_jump) {
		global.controller_use = 0;

	}

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

	if (keyboard_check_released(ord("A"))) or (keyboard_check_released(ord("D"))) or (gamepad_button_check_released(global.controller_device,gp_padl)) or (gamepad_button_check_released(global.controller_device,gp_padr)) {
		hsp = 0;
		acRate = 0;
	}

	onGround = place_meeting(x,y+1,pCollision);

	//Get movement
	hsp = (move * spd)*acRate;
	if (sign(move == 0)) hsp += slide;
	slide = Approach(slide,0,0.05);

	vsp = vsp + grv;

	//Jump 
	if (key_jump) and (jumpBuff > 0) {
		vsp = -jumpHeight;
		jp_start_delay = jp_start_delay_set;
	
		//Jump part
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
	}
	if (vsp < 0) and (!key_hold_jump) vsp = max(vsp,-jumpHeight/2);

	//Jetpack
	jp_start_delay = max(jp_start_delay - 1,0);
	if (onGround == false) {
		if (key_hold_jump == true) and (jp_timer > 0) and (jp_start_delay <= 0) { 
			var jp_spd = jp_speed * jp_acRate;
			vsp = -jp_spd;
			if (jp_acRate < 1) ScreenShake(0.75,15);
		
			jp_acRate = min(jp_acRate + jp_acSpd,1);
			jp_timer = max(jp_timer - 1,0);
		
			//Particles
			var rep = 4; 
			jp_part_buff = max(jp_part_buff - 1,0);
			if (jp_part_buff <= 0) {
				repeat(rep) {
					var angle = 270;
					var off = 0;
					off -= random_range(-15,15);
					with (instance_create_layer(x,bbox_bottom+2,"Bullets",oDust)) {
						sprite_index = sDust1;
					
						spd = random_range(0.8,1);
						direction = 270+off;
						alpha_spd = random_range(0.06,0.1);
				}
				jp_part_buff = jp_part_buff_set + random_range(2,-3);
				rep -= 1;
				}
			}
		}
		else {
		jp_acRate = 0;
	
		}
	}
	else {
		jp_timer = jp_timer_set;
		jp_acRate = 0;
	}

	//Horizontal Collision
	hsp += hsp_move;
	if (place_meeting(x+(hsp),y,pCollision)) {
		while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

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
	if (keyboard_check_pressed(vk_shift)) or (gamepad_button_check_pressed(global.controller_device,gp_face4))  or (hp <= 0) or (oGamePlay.fail_state == true) {
		//With oPlayer
		if (hp <= 0) {
			if (oPlayer.energy_current >= 35) {
				oPlayer.energy_current = 35;	
			}
		}
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
	
		//Gun
		current_state = myState.fall;
		with (myGun) can_use = false;
		shoot = false;
	}









}

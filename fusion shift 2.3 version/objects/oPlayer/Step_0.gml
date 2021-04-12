if (global.game_pause == true) exit;

//if (target == false) with (oGamePlay) hp_bar_alpha = Approach(hp_bar_alpha,0,0.1);

//Input
if (target == false) and (no_input == false) {
	var key_up = keyboard_check(global.c_up);
	var key_down = keyboard_check(global.c_down);

	var key_right = keyboard_check(global.c_right);
	var key_left = keyboard_check(global.c_left);
}
else {
	var key_up = 0;
	var key_down = 0;

	var key_right = 0;
	var key_left = 0;
}

if (key_right) or (key_left) or (key_up) or (key_down) {
	global.controller_use = 0;

}

//Controller
if ((abs(gamepad_axis_value(global.controller_device,gp_axislh)) > 0.2) or (abs(gamepad_axis_value(global.controller_device,gp_axislv)) > 0.2) and (target == false) and (no_input == false)) {
	var key_left = abs(min(gamepad_axis_value(global.controller_device,gp_axislh),0))  or (gamepad_button_check(global.controller_device,gp_padl));
	var key_right = max(gamepad_axis_value(global.controller_device,gp_axislh),0) or (gamepad_button_check(global.controller_device,gp_padr));
	var key_up = abs(min(gamepad_axis_value(global.controller_device,gp_axislv),0))  or (gamepad_button_check(global.controller_device,gp_padd));
	var key_down = max(gamepad_axis_value(global.controller_device,gp_axislv),0) or (gamepad_button_check(global.controller_device,gp_padu));
	//var key_hold_jump = gamepad_button_check(global.controller_device,gp_face1) or gamepad_button_check(global.controller_device,gp_shoulderlb);
	
	global.controller_use = 1;
}



if (keyboard_check_released(global.c_left)) or (keyboard_check_released(global.c_right)) or (gamepad_button_check_released(global.controller_device,gp_padl)) or (gamepad_button_check_released(global.controller_device,gp_padr)) {
	hsp = 0;
	acRate = 0;
}
if (keyboard_check_released(global.c_up)) or (keyboard_check_released(global.c_right)) or (gamepad_button_check_released(global.controller_device,gp_padu)) or (gamepad_button_check_released(global.controller_device,gp_padd)) {
	hsp = 0;
	acRate = 0;
}

//Speed Boost



spdBoost = Approach(spdBoost,1,spdBoostDecrease);


//Get move direction
var moveX = key_right - key_left;
var moveY = key_down - key_up;

//Pop out
if (pop_out == true) {
	moveY = -1;
	var maxCount = 12;
	acRateY += acRateSpd+0.075;
	pop_out_timer = min(pop_out_timer + 1,maxCount);
	if (pop_out_timer == maxCount) {
		pop_out = false;	
		pop_out_timer = 0;
	}
}

//Slide effect + acceleration  X
if (sign(moveX != 0)) and (target == false) {
	if (sign(moveX > 0)) slide_x = slide_set;
	if (sign(moveX) < 0) slide_x = -slide_set;
	
	acRateX += acRateSpd;
}
else acRateX = 0;

acRateX = clamp(acRateX,0,1);

//Slide effect + acceleration Y
if (sign(moveY != 0)) and (target == false) {
	if (sign(moveY > 0)) slide_y = slide_set;
	if (sign(moveY) < 0) slide_y = -slide_set;
	
	acRateY += acRateSpd;
}
else acRateY = 0;


//HP and fail state 
var energy_update = energy_current;
if (global.gameMode == "level") or (global.gameMode == "score")  or (room == rSpace) energy_update = 1;

if ((energy_update <= 0) or (kill_player == true) and (oGamePlay.fail_state == false)) /*or (hp < 0)*/ {
	with (oGamePlay) {	
		fail_state = true;
		playerXFailState = other.x;
	}
	no_input = true;
}
if (hp_add == true) {
	hp += 1;	
	
	hp_1Up = 6;
	hp_add = false;
}
hp_1Up = max(hp_1Up - 0.05,0);
hp = clamp(hp,-1,hp_max);
hp_bar_shake = max(hp_bar_shake - 0.05,0);



//Movement X
hsp = ((spd*spdBoost) * moveX) * acRateX;
if (sign(moveX == 0)) hsp += slide_x;
slide_x = Approach(slide_x,0,0.075);

//Movement Y
vsp = ((spd*spdBoost) * moveY) * acRateY;
if (sign(moveY == 0)) vsp += slide_y;
slide_y = Approach(slide_y,0,0.075);

acRateY = clamp(acRateY,0,1);

 
if (oGamePlay.fail_state == false) while (place_meeting(x,y,pCollision)) x -= 1;

//Wind effect
if (global.wind_effect == true) and (global.timeStop == false) {
	hsp = hsp - (global.wind_strenght);
}
if (oGamePlay.fail_state == false) {
	//Horizontal Collision
	hsp += hsp_move;
	if (place_meeting(x+(hsp),y,pCollision)) {
		while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	//Vertical Collision
	vsp_move = clamp(vsp_move,0,0);
	vsp += vsp_move;
	if (place_meeting(x,y+(vsp),pCollision)) {
		while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}

//Time Stop
if (!instance_exists(oStopTimeZone)) and (energy_current > 0 ) and (oGamePlay.fail_state == false) {
	if (((keyboard_check_pressed(global.c_jump)) or (gamepad_button_check_pressed(global.controller_device,gp_shoulderlb)) or (gamepad_button_check_pressed(global.controller_device,gp_face1))) and (target == false)) with (oGamePlay) {
		screen_flash = 0.65;
		if (oGamePlay.levelComplete == false) audio_play_sound(sfx_stop_time,0,0);	
	}
	if (((keyboard_check(global.c_jump)) or (gamepad_button_check(global.controller_device,gp_shoulderlb)) or (gamepad_button_check(global.controller_device,gp_face1))) and (target == false)) {
		regen_timer = regen_timer_set;
		
		global.timeStop = true;	
		global.time = max(global.time - 0.05,0);
	
		energy_current = max(energy_current - global.decrease_time/*0.1*/, 0);
	}
	else {
		global.time = min(global.time + 0.2,1);
		if (global.time == 1) global.timeStop = false;
	}
}
else {
	global.time = min(global.time + 0.2,1);
	if (global.time == 1) global.timeStop = false;
}

//Energy
var spdD = 0;//0.2;
var spdI = global.increase_time; 
if (global.gameMode == "level") {
	var spdD = 0//0.25;
	var spdI = global.increase_time; 
}


regen_timer = max(regen_timer - 1,0);
if /*(target == true) or*/ (regen_timer <= 0) {
	energy_current = min(energy_current + spdI, 100);	
}


//Controll enemies
if (!place_meeting(x,y,pEnemy)) {
	target = false;	
}

//Invinciblity Frames
invs_frames = max(invs_frames - 1,0);









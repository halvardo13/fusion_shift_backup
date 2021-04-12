if (global.game_pause == true) {
	image_speed = 0;
	exit;
}
if (global.time != 0) image_speed = 0;


switch(controled) {
	case 0:
	//Get tagged
	if (place_meeting(x,y,oPlayer)) {
		if (oPlayer.target == false) {
			tagged = true;
		
			//Activate
			if ((keyboard_check_pressed(vk_shift)) or (gamepad_button_check_pressed(global.controller_device,gp_face4))) {
				oPlayer.target = true;	
				controled = true;
			
			}
		
		
		}
	

	}
	else tagged = false;	
	if (global.timeStop == true) exit;
	//Enemy
	vsp = vsp + grv;
	
	//Move
	var dist = point_distance(x,x,oPlayer.x,oPlayer.x);
	var can_see_player = collision_line(x,y,oPlayer.x,oPlayer.y,pCollision,false,true);
	
	if (can_see_player) dist = 0;
	
	if (dist > 32) {
		spd2 = 0.5;
		if (!place_meeting(x+hsp,y+1,pCollision)) side_to = -side_to;
		if (place_meeting(x+hsp,y,pCollision)) side_to = -side_to;
	}
	else {
		hsp = 0;
		spd2 = 0;	
	}
	
	hsp = spd2 * side_to;
	
	//Stunned
	if (stunned = true) {
		hsp = 0;
		for (var i = 0;i <= 2;i++) {
			with (star[i]) can_draw = true;
		}
		if (controled == true) stun_timer = 0;
		stun_timer = max(stun_timer - 1,0);
		if (stun_timer <= 0) {
			stun_timer = stun_timer_set;
			for (var i = 0;i <= 2;i++) {
				with (star[i]) can_draw = false;
			}
		
			stunned = false;
		}
	}
	
	//Shoot
	if (stunned == false) shoot = true;
	else shoot = false;
	

	
	//Horizontal Collision
	if (place_meeting(x+(hsp),y,pCollision)) {
		while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	//Vertical Collision
	if (place_meeting(x,y+(vsp),pCollision)) {
		while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
	
	
	//HP
	if (hp <= 0) {
		oGamePlay.comboAdd = true;
		instance_destroy();
	
	}
	break;
	//Being controled
	case 1:
	PlayerControlMelee();
	
	
	break;


}

//Animation
if (in_attack == false) {
	if (!place_meeting(x,y+1,oWall))
	{
		sprite_index = sEnemyPirateSwordJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		if (sprite_index == sEnemyPirateSwordJump) 
		{
		
		
		}
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sEnemyPirateSword;
		}
		else
		{
			sprite_index = sEnemyPirateSwordRun;
		}
	}
}
else {
	image_speed = 1;
	
	
	sprite_index = sEnemyPirateSwordAttack_1;	
}
//if (hsp != 0) image_xscale = sign(hsp);


if (global.game_pause == true) or (global.timeStop == true) {
	
	exit;
}


//States + logic
var player_onGround = oPlayer.host_onGround;
switch(boss_state) {
	//IDLE STATE
	case t_state_attack.idle:
		
		
		//Switch to fly attack
		point_to = instance_furthest(x,y,oTribeBossGotoPoint);
		if (player_onGround == true) {
			boss_state = t_state_attack.atc_fly;
		}
		else {
			boss_state = t_state_attack.atc_spear_throw;	
			
		}
		if (Chance(0.2)) boss_state = t_state_attack.atc_fly;
	break;
	//FLY ATC STATE
	case t_state_attack.atc_fly:
		var xx = point_to.x;
		
		x = Approach(x,xx,fly_spd);
		if (x == xx) {
			//Cool down before changing state
			cool_down = max(cool_down - 1,0);
			//Change State
			if (cool_down <= 0) {
				if (image_xscale == 1) image_xscale = -1;
				else image_xscale = 1;
				if (player_onGround == true) {
					if (Chance(0.5)) boss_state = t_state_attack.idle;	
					else boss_state = t_state_attack.atc_spear_throw;
				}
				else boss_state = t_state_attack.atc_spear_throw;	
				cool_down = cool_down_set;
			}
		}
	break;
	//THROW ATC STATE
	case t_state_attack.atc_spear_throw:
		//Attack
		fRate = max(fRate - 1,0);
		if (fRate <= 0) {
			var dir_to_player = point_direction(x,y,oPlayer.x,oPlayer.y);
			with (instance_create_layer(x,y,"Bullets",oBulletEnemyAR)) {
				direction = dir_to_player;
				image_angle = dir_to_player;
			
				mySpd = 2;
				damage = global.damage_pirate;
			}
			fRate = fRateMax;
		}
		
		//Timer
		spear_attack = max(spear_attack - 1,0);
		if (spear_attack <= 0) {
			boss_state = t_state_attack.idle;
			
			spear_attack = spear_attack_timer;
			fRate = fRateMax;
		}
	break;
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
hsp_move = Approach(hsp_move,0,0.2);
				
//Vertical Collision
vsp = vsp + grv;
vsp += vsp_move;
if (place_meeting(x,y+(vsp),pCollision)) {
	while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
vsp = clamp(vsp,-100,max_down_vsp);
vsp_move = Approach(vsp_move,0,0.2);

//Health
if (hp <= 0) {
	instance_destroy();	
	
}
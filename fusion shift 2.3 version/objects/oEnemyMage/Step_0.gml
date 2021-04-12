//Pause
if (global.game_pause == true) {
	image_speed = 0;
	exit;
}
if (global.time != 0) image_speed = 0;
if (instance_exists(oStopTimeZone)) exit;

switch(controled) {
	//Normal State
	case 0:
		spd = spd_enemy;
		//Get tagged
		TakeOverEnemy();
		
		if (global.timeStop == true) or (global.time == 0) exit;
		var point_distX = point_distance(x,x,oPlayer.x,oPlayer.x);
		var point_dist = point_distance(x,y,oPlayer.x,oPlayer.y);
		//var point_collision = collision_line(x,y,oPlayer.x,oPlayer.y,pCollision,false,true);
		//Idle state
		if (current_state != myState.fall) {
			if (current_state == myState.idle) {
				//Toggle idle state
			
			
				//Switch to attack
				if (point_dist <= range_to_attack_run) {
					current_state = myState.attack_run;
				
				}
			}
		
		
		
			//Attack Run state
			if (current_state == myState.attack_run) {
				if (point_dist > range_to_attack_run) current_state = myState.idle;
				if (point_distX <= range_to_attack) {
					run_state = 2;
				
				}
			}
			else {
				if (run_state == 2) {
					//Attack state
					//if (point_distX > range_to_attack) run_state = 2;
				}
			}
		}
		
		//Switch states
		switch (current_state) {
			//Idle
			case myState.idle:
				hsp = 0;
				
				
			break;
			
			case myState.fall:
				
				
			break;
			
			//attack_dogde
			case myState.attack_dogde:
				
				
				shoot = false;
			break;
			//Attack Run
			case myState.attack_run:
				if (set_alarm == true) alarm[0] = set_alarm_timer; set_alarm = false;
			
				switch (run_state) {
					case 0: //Follow 
						if (oPlayer.x > x) hsp = spd;
						else hsp = -spd;
						shoot = true;
					break;
					case 1:
						switch_side = max(switch_side - 1,0);
						if (switch_side <= 0) and (vsp == 0) {
							hsp = choose(spd_enemy,-spd_enemy);	
							switch_side = irandom_range(move_1,move_2);
						}
					
					break;
					case 2:
						
					break;
			}
			break;
			//Attack
			case myState.attack:
				hsp = 0;
				shoot = true;
			break;
			//Stunned
			case myState.is_stunned:
				EnemyStunned();			
			break;
		}
		
		onGround = place_meeting(x,y+1,pCollision);
		if (current_state == myState.fall) and (onGround == true) {
			current_state = myState.is_stunned;
			stunned = true;
			
		}
		if (!place_meeting(x+hsp,y+1,pCollision)) and (onGround == true) vsp = -3;
		
		//Wind effect
		//if (global.wind_effect == true) and (global.timeStop == false) and (onGround == false) {
		//	hsp = hsp - (global.wind_strenght);
		//}
		
		Sinkhole();
		//Horizontal Collision
		hsp += hsp_move;
		hsp = hsp * hsp_aim;
		if (in_sinkhole == true) hsp = hsp * 0.25; 
		if (place_meeting(x+(hsp),y,pCollision)) {
			if (current_state == myState.attack_run) and (onGround == true) {
				vsp = -2.5;
				can_jump = false;
			}
			while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
				x += sign(hsp);
			}
			hsp = 0;
		}
		x += hsp;
		
		hsp_move = Approach(hsp_move,0,0.2);
		
		//Vertical Collision
		EnemyGravityLine();
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
		
		//Trown Out + Slide
		if (onGround == true) {
			if (trown_out == true) {
				slide_out = true;
			}
			trown_out = false;
		}
		if (slide_out == true) {
			hsp = Approach(hsp,0,0.035);
			
			
						/*temp*/stunned = false;
						/*temp*/current_state = myState.idle;	
		}
		
		//HP
		if (hp <= 0) {
			oGamePlay.comboAdd = true;
			instance_destroy();
	
		}
	break;
	//Controlled state
	case 1:
		spd = 2;
		PlayerControl();
	
	break;
}

//Animation
ThreeSpriteAnimation(sEnemyMage,sEnemyMageRun,sEnemyMageJump);


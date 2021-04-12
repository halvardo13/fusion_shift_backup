//Forcefield
var dir = point_direction(x,y,oPlayer.x,oPlayer.y);
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

	
//Pause
if (global.game_pause == true) or (global.timeStop) {
	image_speed = 0;
	exit;
}
else image_speed = 1;
PirateBossWave(5,1.35);


//Bomb attack
var percentHP = ((hp / hp_max) * 100);

if (bomb_attack == false) and (percentHP <= 85) bomb_attack_timer = max(bomb_attack_timer - 1,0);
if (bomb_attack_timer <= 0) {
	bomb_attack = true;
	var inst = instance_find(oPirateBossAttackPoint, irandom(instance_number(oPirateBossAttackPoint) - 1));
	with (inst) {
		activate = true;
		
	}
	bomb_attack_timer = bomb_attack_timer_set;
	
	bullet_defence = true;
	
	instance_create_layer(x,y,"Bullets",oPirateBossSheild);
}

//Bullet Defence
if (bullet_defence == true) {
	
	
	
	
}

//Destroy
if (hp <= 0) instance_destroy();
//Hp
hp_max = 100;
hp = hp_max;
hp_fake = hp;
flash = 0;
flash_dercease = 0.04;
is_enemy = true;

hp_bar_alpha_set = 3.5;
hp_bar_alpha = hp_bar_alpha_set;

controled = false;

aim_assist_x = x;
aim_assist_y = y;


//Setup States
enum myState {
	idle,
	fall,
	is_stunned,
	attack_dogde,
	attack_run,
	attack
	
}

move_1 = 200;
move_2 = 280;

hit_from = 0;

//Movement
hsp = 1;
hsp_final = 0;
hsp_move = 0;
vsp = 0;
vsp_move = 0;
grv = global.enemy_grv;
spd = 2;
spd2 = 0.5;

max_down_vsp = global.enemy_grv_max_dwn_spd;

force_jump = false;

jumpHeight = 3.5;
jumpBuff = 0;

slide = 0;
slide_set = 1;
acRate = 0;
acRateSpd = 0.035;

xscale = 1;
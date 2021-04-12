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

in_sinkhole = false;
sheild = false;
sheild_scale = 1;

move_1 = 450;
move_2 = 500;

hit_from = 0;

killed_by = -1;

footsteps_timer_set = 35;
footsteps_timer = footsteps_timer_set;

//Movement
hsp_aim = 1;
hsp = 1;
hsp_final = 0;
hsp_move = 0;
vsp = 0;
vsp_move = 0;
grv = global.enemy_grv;
grv_change = 1;

onGround = false;

//Moon grv
if (room == rmLvl_3_3) or (room == rmLvl_3_4) or (room == rmLvl_3_5) or (room == rmLvl_3_6) or (room == rmLvl_3_7) or (room == rmLvl_3_8) or (room == rmLvl_3_9) or (room == rMoonBase) or (room == rMars) or (room == rAstroidField) {
	grv = global.moon_grv;
}

spd = 2;
spd2 = 0.5;

max_down_vsp = global.enemy_grv_max_dwn_spd;

force_jump = false;

jumpHeight = 3.5;
jumpBuff = 0;

buffer_counter = 0;
buffer_max = 8; 

slide = 0;
slide_set = 1;
acRate = 0;
acRateSpd = 0.035;

xscale = 1;


DissolveSettings(sDissolveEnemy,0,c_orange,c_red,0);

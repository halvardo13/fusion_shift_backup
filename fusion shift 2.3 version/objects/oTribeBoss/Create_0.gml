// Inherit the parent event
event_inherited();

damage = 100;

hsp = 0;


hp_max = 750;
hp = hp_max;
hp_fake = hp_max;

fly_spd = 2.5;
point_to = noone;

cool_down_set = 75;
cool_down = cool_down_set;

spear_attack_timer = 140;
spear_attack = spear_attack_timer;

fRateMax = 35;
fRate = fRateMax;

//Boss States
enum t_state_attack {
	idle, //Stop where stadig
	atc_fly,//Fly to the other side of the map
	atc_spear_throw,
	
	
	
}
boss_state = t_state_attack.idle;
event_inherited();
hsp = 0;
hsp_move = 0;
spd = 2;
spd_enemy = 0.75;
can_jump = true;
switch_side = 0;


jumpHeight = 2.5;

create_particle = false;

stun_timer_set = 120;
stun_timer = stun_timer_set;
stunned = false;

tagged = false;



myGun = instance_create_layer(x,y,"Player",oGunAR);
with (myGun) ownerID = other.id;
shoot = false;

current_state = myState.idle;
trown_out = false;
slide_out = false;

take_over_effect_scale = 0;
take_over_effect_alpha = 0;


run_state = 0;
set_alarm = true;
set_alarm_timer = 100;

range_to_attack_run = 110;
range_to_attack = 24;

//Jetpack
jp_timer_set = 35;
jp_timer = jp_timer_set;

jp_start_delay_set = 20;
jp_start_delay = jp_start_delay_set;

jp_speed = 2.5;

jp_acRate = 0;
jp_acSpd = 0.03;

jp_part_buff_set = 4;
jp_part_buff = jp_part_buff_set;



//Outline shader
upixelW = shader_get_uniform(shOutline,"pixelW");
upixelH = shader_get_uniform(shOutline,"pixelH");

texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));
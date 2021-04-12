event_inherited();
hsp = 0;
hsp_move = 0;
spd = 2;
spd_enemy = 0.75;
can_jump = true;
switch_side = 0;

create_particle = false;

stun_timer_set = 120;
stun_timer = stun_timer_set;
stunned = false;

tagged = false;



myGun = instance_create_layer(x,y,"Player",oGunSMG);
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

//Outline shader
upixelW = shader_get_uniform(shOutline,"pixelW");
upixelH = shader_get_uniform(shOutline,"pixelH");

texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));
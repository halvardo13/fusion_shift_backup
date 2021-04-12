//Setup
event_inherited();


hp_max = 1250;
hp = hp_max;
hp_fake = hp_max;

attack = "idle";

idle_timer_set = 120;
idle_timer = idle_timer_set;

fRateNormalSet = 15;
fRateNormal = fRateNormalSet;

normalShootTimerSet = fRateNormalSet * 14;
normalShootTimer = normalShootTimerSet;

fRate360Set = 25;
fRate360 = fRate360Set;

timer360set = fRate360Set * 20;
timer360 = timer360set;

shoot_360_dir = 0;




//Defence
force_field_radius = 48;
force_field_strength_max = 2.2;
force_field_strength_min = 0.75;
force_field_strength = force_field_strength_min;

force_field_alpha = 0;

bullet_defence = false;





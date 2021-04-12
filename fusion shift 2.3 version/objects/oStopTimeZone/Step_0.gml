if (instance_exists(oEndlessModeSpawner)) {
	with (oEndlessModeSpawner) {	
		spawn_rate = 45;
	
	}
}








if (place_meeting(x,y,oPlayer)) {
	global.timeStop = true;
	global.time = max(global.time - 0.05,0);
	
	with (oPlayer) oPlayer.energy_current = 100;
	with (oGamePlay) levelTimer = 0;
}
else destroy = true;

if (global.game_pause == false) s = Wave(2.5,2.75,1.6,0);

if (destroy == true) {
	destroy_timer = max(destroy_timer - 1,0);	
	if (destroy_timer >= 0) {
		instance_destroy();
	}
	var dirTo = point_direction(x,y,oPlayer.x,oPlayer.y)
	var count = irandom_range(6,8);
	for (var i = 0; i <= count;i++) {
		with (instance_create_layer(oPlayer.x,oPlayer.y,"Bullets",oTimeShard)) {
			dir = (dirTo)+choose(random_range(15,45),random_range(-15,-45));
			
			
		}
	}
	create_part = false;
	
	
	with (oGamePlay) start_level = false;
}
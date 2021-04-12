if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;
	
	exit;
}
else image_speed = 1;
PirateBossWave(4,1.5);





//Spawn
if (global.enemyCount <= max_enemies) and (instance_exists(oPirateBoss)) {
	spawn_counter = max(spawn_counter - 1,0);
	if (spawn_counter <= 0) {
		instance_create_layer(x+random_range(-5,5),y,"Enemies",oEnemyPirate);
	
		spawn_counter = spawn_couter_max;
	}
}



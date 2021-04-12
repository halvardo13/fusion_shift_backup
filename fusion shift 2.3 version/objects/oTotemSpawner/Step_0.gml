//Pause
if (global.game_pause == true) or (global.timeStop == true) {
	exit;
}


//Spawner
var player_dist = point_distance(x,y,oPlayer.x,oPlayer.y);
if (player_dist <= range) {
	var enemies = max_enemies; 
	if (room == rmLvl_2_9) var enemies = 4;
	if (global.enemyCount <= enemies) spawnRate = max(spawnRate - 1,0);
	if (spawnRate <= 0) {
		with (instance_create_layer(x,y,"Bullets",oSpawnerOrb)) {	
			direction = random_range(-20,200);
			speed = random_range(0.8,1.2);
			
		}
		spawnRate = spawnRateSet + random_range(25,85);	
	}
	
}


//HP
if (hp <= 0) {
	instance_destroy();	
	
}



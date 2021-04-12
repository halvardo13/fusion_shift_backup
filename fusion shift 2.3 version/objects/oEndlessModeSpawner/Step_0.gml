if (oGamePlay.fail_state == true) {
	spawn_rate = spawn_rate_set;
	
	if (instance_exists(pEnemy)) {
		with (pEnemy) {	
			killed_by = "spawner";
			
			instance_destroy();
		}
	}
	exit;
}

if (instance_exists(oPortal)) {
	if (oPortal.active == true) exit;
}
///@desc Spawner
if (global.game_pause == false) spawn_rate = max(spawn_rate - 1,0);
if (spawn_rate <= 0) {

	//Choose enemy
	enemy_spawn = random_range(0,enemy_pool_count);
	
	//Check previous
	if (enemy_previous != -1) {
		if (enemy_spawn == enemy_previous) {
			enemy_spawn -= random_range(0,enemy_pool_count);
			
		}
		
	}
	
	//Record enemy type
	enemy_previous = enemy_spawn;
	
	//Clamp
	if (enemy_spawn < 0) enemy_spawn = enemy_pool_count;
	if (enemy_spawn > enemy_pool_count) enemy_spawn = 0;

	//Get position
	var xx = room_width/2+(random_range(room_width*0.4,-room_width*0.4));
	var yy = 64;
	
	//Spawn in
	if (enemy_max_count >= global.enemyCount) {
		instance_create_layer(xx,yy,"Enemies",enemy_list[enemy_spawn]);
	}
	spawn_rate = oEndlessController.current_spawn_set;
}







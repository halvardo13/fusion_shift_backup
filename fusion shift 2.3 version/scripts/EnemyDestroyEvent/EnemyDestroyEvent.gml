function EnemyDestroyEvent() {
	audio_play_sound(sfx_enemy_death,0,0);


	if (global.enemyCount != 0) with (oGamePlay) enemyCountAlpha = enemyCountAlphaSet;
	if (hp <= 0) {
		if (global.gameMode == "score") {
		var scrCount = choose(2,3);
			while (scrCount != 0) {
				with (instance_create_layer(x,y,"Other",oScore)) {
					hsp = choose(random_range(-2.5,-1.5),random_range(2.5,1.5));
					vsp = random_range(-3,-3.5);
			
				}
				scrCount -= 1;
			}
		}
	}
	with (myGun) instance_destroy();

	ScreenShake(1,45);


	with (instance_create_layer(x,y,"Bullets",oBlood)) {
		hit_from = other.hit_from;
		direction = hit_from;

	}
	if (killed_by = "spawner") exit;

	//Killed 
	if (killed_by != "lava") {
		with (instance_create_layer(x,y,"Enemies",oEnemyDead)) {
			global.stat_total_kills += 1;
		
			sprite_index = other.sprite_index;
			image_xscale = other.xscale;
		
			disolve_sprite = sDisolveEnemyKilled;
			base_disolve_spd = 0.02;
			base_disolve_start = 0.75;
	
			var col1 = make_color_rgb(231,19,52);
			var col2 = make_color_rgb(192,104,134);
		
			DissolveSettings(disolve_sprite,0,col1,col2,0.2);
		}
	}
	//Killed By lava
	if (killed_by == "lava") {
		global.stat_total_kills += 1;
	
		with (instance_create_layer(x,y,"Enemies",oEnemyDead)) {
			sprite_index = other.sprite_index;
			image_xscale = other.xscale;
		
			disolve_sprite = sDissolveEnemy;
			base_disolve_spd = 0.01;
			base_disolve_start = 0.75;
			DissolveSettings(disolve_sprite,0,c_red,c_orange,0.2);
		}
	}





}

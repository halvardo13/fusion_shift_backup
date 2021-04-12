image_speed = 0;
if (global.game_pause == true) or (oGamePlay.fail_state == true) {
	exit;
}

//Horizontal Collision
if (place_meeting(x+(hsp),y,pCollision)) {
	while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
		x += sign(hsp);
	}
	hsp = -hsp;
}
var waveLength = 0;
if (global.timeStop == false) {
	x += hsp;
	image_speed = 1;	
	var waveLength = 2;
}
image_xscale = sign(hsp);

//HP
if (hp <= 0) {
	
	
	
	instance_destroy();	
}

//Wave
y = Wave(yMain,yMain-waveLength,0.6,0);

//Spawn Enemies
if (global.enemyCount < 10) spawnRate = max(spawnRate - 1,0);
if (spawnRate <= 0) and (global.timeStop == false) {
	var e = oEnemyAR;
	if (Chance(0.4)) e = oEnemyShotgun;
	instance_create_layer(x,y,"Enemy",e);
	
		


	spawnRate = spawnRateSet - (random_range(-145,145));
}


//Pause / time stop
if (global.game_pause == true) or (global.timeStop == true) {
	speed = 0;
	exit;
}
speed = spd_set;

//Wave
var waveSPD = 0.6;
xWave = Wave(-0.4,0.4,waveSPD,0);
yWave = Wave(-0.4,0.4,waveSPD,0);

x += xWave;
y += yWave;

//Self destoy
destroy_timer = max(destroy_timer - 1,0);
if (destroy_timer <= 0) {
	//Create bullets
	var rep = irandom_range(6,9);
	repeat(rep) {
		with (instance_create_layer(x,y,"Bullets",oMarsBullet2)) {
			direction = random_range(-30,200);
			image_angle = direction;
			mySpd = random_range(1.8,2);
			speed = mySpd;
		}
	}
	instance_destroy();	
}



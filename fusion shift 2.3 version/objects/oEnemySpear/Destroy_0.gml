global.enemyCount -= 1;
if (hp <= 0) {
	var scrCount = choose(2,3);
	while (scrCount != 0) {
		with (instance_create_layer(x,y,"Other",oScore)) {
			hsp = choose(random_range(-2.5,-1.5) , random_range(2.5,1.5));
			vsp = random_range(-3,-3.5);
			
		}
		scrCount -= 1;
	}
}
with (myGun) instance_destroy();


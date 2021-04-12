//Spawn astoriods
spawnRate = max(spawnRate - 1,0);
if (spawnRate <= 0) and (oGamePlay.levelComplete == false) {
	var xx = random_range(oPlayer.x - 165,oPlayer.x + 165);
	var yy = 0;
	
	with (instance_create_layer(xx,yy,"Bullets",oAstroid)) {
		
	}
	spawnRate = spawnRateSet;
}




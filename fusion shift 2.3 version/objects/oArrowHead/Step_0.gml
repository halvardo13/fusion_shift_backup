





if (oPlayer.y == clamp(oPlayer.y,y-6,y+6)) {
	
	
	fRate = max(fRate - 1,0);
	if (fRate <= 0) {
		with (instance_create_layer(x,y,"Bullets",oArrow)) {
			direction = 0;
			speed = 3;
		}
		fRate = fRateMax;
	}
	
}


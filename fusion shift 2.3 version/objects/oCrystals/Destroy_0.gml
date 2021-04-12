var rep = irandom_range(10,13);
ScreenShake(1,15);
repeat(rep) {
	with (instance_create_layer(x+sprite_width/2,y,"Bullets",oCrystalEffect)) {
		direction = random_range(0,360);
		spd = random_range(-1.6,2.4);
		
		image_speed = 0;
	}
}


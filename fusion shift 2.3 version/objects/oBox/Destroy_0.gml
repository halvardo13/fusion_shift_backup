with (myWall) instance_destroy();

var rep = irandom_range(10,13);
ScreenShake(1,15);
repeat(rep) {
	with (instance_create_layer(x+sprite_width/2,y,"Bullets",oOnePixel)) {
		direction = random_range(0,360);
		spd = random_range(-1.6,2.4);
		col = make_color_hsv(10,75,40);
		
		image_yscale = random_range(1,3);
		image_xscale = random_range(1,3);
	}
}


audio_play_sound(sfx_box_explode,0,0);

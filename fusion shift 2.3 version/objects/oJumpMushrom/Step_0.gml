if (!instance_exists(oPlayer)) exit;

i=(instance_place(x,y,pEnemy))
with (i)
{
	if (sign(vsp) > 0) {
			vsp = -5;
			image_index = 0;
			other.image_speed = 1;
			other.xscale = 1.5;
			other.yscale = 0.4;
			other.hit = true;
			other.in_animation = true;
			
			
			instance_create_layer(other.x,other.y-8,"Other",oJumppadAnimation);
			var rep = irandom_range(10,13);
			
			
	ScreenShake(1,15);
	repeat(rep) {
	with (instance_create_layer(x,y,"Bullets",oOnePixel)) {
		direction = random_range(0,360);
		spd = random_range(-1.6,2.4);
		col = make_color_rgb(44,231,245);
		
		image_yscale = random_range(1,3);
		image_xscale = random_range(1,3);
	}
	
	}

}


}

if (hit == true) and (yscale == 0.8) {
	yscale = 1.35;
	xscale = 0.65;
	hit = false;
}
if (hit == false) and (yscale == 1) and (xscale == 1) in_animation = false;

if (global.timeStop == false) or (global.game_pause == false) {
	if (in_animation == true) image_speed = 1;
	
	
	xscale = Approach(xscale,1,0.04);
	yscale = Approach(yscale,1,0.04);
	image_yscale = yscale;
	image_xscale = xscale;
}
else if (in_animation == true) image_speed = 0;

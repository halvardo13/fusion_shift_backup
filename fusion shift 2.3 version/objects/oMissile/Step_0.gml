if (global.game_pause == true) {
	speed = 0;
	exit;
}
var dirTo = point_direction(x,y,oPlayer.x,oPlayer.y);
speed = speed * global.time;

//Track player 
image_angle = direction;
if (speed >= maxspd) speed = maxspd;

if (global.timeStop == false) {
	if (speed <= minspd) speed = minspd;
	acc = acc*0.95;
	motion_add(dirTo,acc);
}

//Collision Wall
if (place_meeting(x,y,pCollision)) {
	var rep = irandom_range(15,17);
	repeat(rep) {
		with (instance_create_layer(x,y,"Bullets",oOnePixel)) {
			direction = random_range(0,360);
			spd = random_range(-1.6,2.4);
			col = make_color_hsv(220,35,50);
			
			image_yscale = random_range(2,4);
			image_xscale = random_range(2,4);
		}
	}
	ScreenShake(1,15);
	instance_destroy();
}

//Effect
var rep = 2;
repeat(rep) {
	with (instance_create_layer(x,y,"Bullets",oDust)) {
		sprite_index = sDust1;
		alpha_spd = random_range(0.06,0.1);
	}
	jp_part_buff = jp_part_buff_set + random_range(2,-3);
	rep -= 1;
}





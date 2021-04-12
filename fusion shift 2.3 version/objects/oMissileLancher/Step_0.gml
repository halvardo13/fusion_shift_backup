if (global.game_pause == true) or (global.timeStop == true) exit;

var dist = point_distance(x,y,oPlayer.x,oPlayer.y);
var dirPlayer = point_direction(x,y,oPlayer.x,oPlayer.y);

if (fRate < (fRateSet*0.75)) image_angle = dirPlayer;
if (image_angle == clamp(image_angle,90,270)) {
	image_yscale = -1;
}
else {
	image_yscale = 1; 
}

//Shoot
if (dist <= range) fRate = max(fRate - 1,0);
if (fRate <= 0) {
	with(instance_create_layer(x,y,"Bullets",oMissile)) {
		motion_add(random(360),2);
	
	}
	fRate = fRateSet;
	xscale = 1.65;
	yscale = 0.4;
	
	with (instance_create_layer(x,y,"Bullets",oMissleAnimation)) image_angle = other.image_angle;	
}

//Stretch
if (fRate <= 40) and (fRate > 0) {
	xscale = Approach(xscale,0.4,0.05);	
	
}
if (fRate > 40) {
	xscale = Approach(xscale,1,0.035);
	yscale = Approach(yscale,1,0.035);
}
/*
image_xscale*xscale;
image_yscale*yscale;







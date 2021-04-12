var xDist = point_distance(x,x,oPlayer.x,oPlayer.x);
var yDist = point_distance(y,y,oPlayer.y,oPlayer.y);

var dir = 0;
var xRange = 200;
var min_ = 0;
var yRange = 32;
if (image_xscale == -1) {
	min_ = -200;
	xRange = 0;
	var dir = 180;
}

recoil = max(0,recoil - 1);
if (xDist == clamp(xDist,min_,xRange)) and (yDist == clamp(yDist,-yRange,yRange)) and (global.timeStop == false) {
	fRate = max(fRate - 1,0);	
	recoil = 4;
	if (fRate <= 0) {
	
		with (instance_create_layer(x,y,"Other",oBulletEnemyAR)) {
			direction = dir;
			image_angle = dir;
			
			mySpd = 3;
			damage = 35;
		
		}
		fRate = fRateSet;
		bullet_flash = bullet_flash_set;
	}
	
}


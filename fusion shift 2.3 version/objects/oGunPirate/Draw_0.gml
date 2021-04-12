draw_self();

//Draw bullet flash 
bullet_flash = max(bullet_flash - 1,0);
if (bullet_flash > 0) {	
	var dir = point_direction(x,y,oPlayer.x,oPlayer.y);
	var sprite = sBulletEnemyAR;
	if (can_use == true) {
		var sprite = sBulletAR;
		var dir = point_direction(x,y,mouse_x,mouse_y);	
		if (global.controller_use == 1) dir = global.controllerAngle;
	}
	
	
	var xx = x + lengthdir_x(10, dir);
	var yy = y + lengthdir_y(10, dir);
	
	draw_sprite(sprite,0,xx,yy);	
	
}




draw_self();
//Draw bullet flash 
bullet_flash = max(bullet_flash - 1,0);
if (bullet_flash > 0) {	
	var dir = 0;
	var sprite = sBulletEnemyAR;

	var xx = x + lengthdir_x(8, dir);
	var yy = y + lengthdir_y(8, dir);
	
	draw_sprite(sprite,0,xx,yy);	
	
}


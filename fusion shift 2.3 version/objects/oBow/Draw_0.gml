//Hit flash / draw self
if (flash == 1) audio_play_sound(sfx_bow_ready,0,0);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
	shader_reset();
	if (global.game_pause == false) flash = max(flash - 0.05,0);
}

shader_reset();



//draw_text(oPlayer.x,oPlayer.y,string(strength))
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
	
	
	//var xx = x + lengthdir_x(10, dir);
	//var yy = y + lengthdir_y(10, dir);
	
	//draw_sprite(sprite,0,xx,yy);	
	
}




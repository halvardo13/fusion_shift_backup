if (tagged == true) {
	//draw_sprite(sPointer,0,x,y-16);
	
	
	
	shader_set(shOutline);
	shader_set_uniform_f(upixelW,texelW);
	shader_set_uniform_f(upixelH,texelH);
}
else {
	shader_reset();
	
	if (oPlayer.target == false) {
		
		yy = Wave(y-10,y-16,0.85,0);
		
		draw_sprite(sPointer,0,x,yy);
	}
}

draw_sprite_ext(sprite_index,image_index,x,y,xscale,image_yscale,image_angle,c_white,image_alpha);

if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,image_yscale,image_angle,c_white,image_alpha);
	shader_reset();
	if (global.game_pause == false) flash = max(flash - 0.05,0);
}

shader_reset();

//draw_sprite(sEnemyMask,0,x,y);
//Hit flash
draw_self();
if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,image_yscale,image_angle,c_white,image_alpha);
	shader_reset();
	if (global.game_pause == false) flash = max(flash - flash_dercease,0);
}

shader_reset();



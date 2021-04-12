draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
	shader_reset();
	if (global.game_pause == false) flash = max(flash - 0.05,0);
}
shader_reset();
//Hit flash
draw_sprite(sprite_index,subimg,x,y);
if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_sprite(sprite_index,subimg,x,y);
	shader_reset();
	if (global.game_pause == false) flash = max(flash - 0.05,0);
}

shader_reset();

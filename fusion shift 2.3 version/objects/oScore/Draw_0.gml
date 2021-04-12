
draw_self();
if (flash > 0) {
	ChooseColor(255,255,255,flash);
	draw_self();
	shader_reset();
	if (global.game_pause == false) flash = max(flash - 0.025,0);
}
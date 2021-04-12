if (global.myDebug == true) {
	var c = c_white;
	if (current_state != myState.idle) c = c_red;
	draw_line_color(x,y,oPlayer.x,oPlayer.y,c,c);
	
	draw_circle(x,y,global.enemyTakeOverRange,true);
	

}


//Take over effect
if (global.game_pause == false) and (global.timeStop == false) {
	take_over_effect_scale = Approach(take_over_effect_scale,10,0.05);
	take_over_effect_alpha = Approach(take_over_effect_alpha,0,0.05);
}

ChooseColor(255,255,255,take_over_effect_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,xscale * take_over_effect_scale,image_yscale * take_over_effect_scale,image_angle,c_white,1);
shader_reset();




//HP Bar
EnemyHealthBar();

if (tagged == true) {
	if (controled == false) hp_bar_alpha = hp_bar_alpha_set;
	//Outline Shader Set
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
	if (global.game_pause == false) flash = max(flash - flash_dercease,0);
}
shader_reset();

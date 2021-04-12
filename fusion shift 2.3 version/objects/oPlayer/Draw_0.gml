var wxx = x-xprevious;
var wyy = y-yprevious;
if (oGamePlay.fail_state == false) {
	if (target = false) and (stop_draw == false) draw_sprite_ext(sprite_index,0,x,y,1+(wxx*0.06),1+(wyy*0.06),image_angle,c_white,1);
}
else if (stop_draw == false) draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1);




if (jump_out_effect == true) {
	jump_out_alpha = 0.8;
	jump_out_scale = 1;
	ScreenShake(1,25);
	
	jump_out_effect = false;
}

if (global.game_pause == false) {
	jump_out_alpha = Approach(jump_out_alpha,0,0.05);
	jump_out_scale = Approach(jump_out_scale,5,0.09);
}

ChooseColor(255,255,255,jump_out_alpha);
draw_sprite_ext(sprite_index,0,x,y,jump_out_scale,jump_out_scale,image_angle,c_white,jump_out_alpha);
shader_reset();

//Combo
var scale = 0.4;
var off = 0.8;
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_set_color(c_black);
draw_set_alpha(combo_alpha);

draw_text_transformed(x+off,(y-8)+off,"Combo:" +string(combo),scale,scale,0);

draw_set_color(c_white);
draw_text_transformed(x,(y-8),"Combo:" +string(combo),scale,scale,0);

combo_alpha = max(combo_alpha - 0.05,0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
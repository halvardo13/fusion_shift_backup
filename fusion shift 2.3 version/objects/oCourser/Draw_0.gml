//Draw self
if (global.game_pause == true) {
	draw_sprite_ext(sprite_index,image_index,x,y,scaleUp,scaleUp,image_angle,c_white,image_alpha);
	exit;	
}

if (room != rMenu) {
	if (instance_exists(oPlayer)) {
		if (oPlayer.target == true) {
			draw_sprite_ext(sprite_index,image_index,x,y,scaleUp,scaleUp,image_angle,c_white,image_alpha);
		}
	}
}
else {
	draw_sprite_ext(sprite_index,image_index,x,y,scaleUp,scaleUp,image_angle,c_white,image_alpha);
}

//Aim Assist
if (global.myDebug == true) {
	var c = c_white;
	if (aim_assist_target == true) {
		var c = c_red;
		draw_sprite(sOnePixel,0,mouse_x,mouse_y);
		
	}
	draw_circle_color(mouse_x,mouse_y,aim_assist_radius,c,c,true);	
	
	
	//Show cam stretch
	if (instance_exists(oPlayer)) {
		var sX = lerp(oPlayer.x,x,0.05);
		var sY = lerp(oPlayer.y,y,0.05);
		draw_sprite_ext(sXMark,0,sX,sY,1,1,0,c_black,1);
	}
	
	
}











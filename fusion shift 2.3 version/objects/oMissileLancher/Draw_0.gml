draw_sprite(sMissileLancherUnder,0,x,y);


draw_sprite_ext(sMissileLancher,image_index,x,y,ix*xscale,image_yscale*yscale,image_angle,c_white,image_alpha);



if (global.myDebug == true) {
	var dist = point_distance(x,y,oPlayer.x,oPlayer.y);
	if (dist <= range) {
		draw_line_color(x,y,oPlayer.x,oPlayer.y,c_red,c_red);
	}
	else draw_line_color(x,y,oPlayer.x,oPlayer.y,c_white,c_white);
}


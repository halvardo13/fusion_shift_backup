if (oGamePlay.fail_state == false) {
	if (enter_warp == true) {
		if (room != rMenu) {
			var scale = 5 * GUI_SCALE;
			
			draw_sprite_ext(sInPortal,subimg,0,0,scale,scale,0,c_white,alpha_);
		
		}
		var xx = GUI_W/2;
		var yy = GUI_H/2-32;
		var scale = 1.5;
		var off = 3;
		var yMove = 38;
		
		if (dot_timer >= 0) var str1 = "Entering WarpZone";
		if (dot_timer >= 30) var str1 = "Entering WarpZone."
		if (dot_timer >= 60) var str1 = "Entering WarpZone.."
		if (dot_timer >= 90) var str1 = "Entering WarpZone..."
		
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		
		
		draw_text_transformed_color(xx+off,yy+off,str1,scale,scale,0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xx,yy,str1,scale,scale,0,c_white,c_white,c_white,c_white,1);
	
		draw_text_transformed_color(xx+off,(yy+off)+yMove,"Warping to: " +warp_list[warp_choose,0],scale,scale,0,c_black,c_black,c_black,c_black,1);	
		draw_text_transformed_color(xx,yy+yMove,"Warping to: " +warp_list[warp_choose,0],scale,scale,0,c_white,c_white,c_white,c_white,1);
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}

}

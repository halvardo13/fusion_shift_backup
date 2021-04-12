if (global.game_pause == true) {
	//Rectangle
	var xSize = 128;
	var ySize = 192;
	
	var start_rec_xx = GUI_W/2-xSize;
	var start_rec_yy = GUI_H/2+ySize;
	
	var end_rec_xx = GUI_W/2+xSize;
	var end_rec_yy = GUI_H/2-ySize;
	
	draw_set_alpha(0.45);
	draw_roundrect_color_ext(start_rec_xx,start_rec_yy,end_rec_xx,end_rec_yy,15,15,c_black,c_black,false);
	draw_set_alpha(1);
	
	//Text
	var xx = start_rec_xx + 16;
	var yy = start_rec_yy + 32;
	for (var i = 0;i <= items;i++) {
		var yMove = 24*i;
		
		
		
		draw_text(xx,yy+yMove,item[i]);
	}
	
}




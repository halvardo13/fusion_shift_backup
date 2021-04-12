if (controled == true) and (global.myDebug == true) {
	var off = 24;
	draw_set_font(fDebug);
	draw_text(16,96,"hsp: " +string(hsp_final));	
	draw_text(16,96+off,"slide: " +string(slide));	
	draw_text(16,96+off*2,"acRate: " +string(acRate));	

}



var xx = GUI_W/2;
var yy = GUI_H/2;

var str = "Game features autosaving.\nPlease let screen transitions finish before closing.";

var scale = 1.5;
var off = 2.5;

draw_set_halign(fa_middle);
draw_set_valign(fa_center);


draw_text_transformed_color(xx+off,yy+off,str,scale,scale,0,c_black,c_black,c_black,c_black,alpha);


draw_text_transformed_color(xx,yy,str,scale,scale,0,c_white,c_white,c_white,c_white,1);






draw_set_halign(fa_left);
draw_set_valign(fa_top);






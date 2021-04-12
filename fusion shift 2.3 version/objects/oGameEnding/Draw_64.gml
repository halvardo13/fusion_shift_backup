if (current_text == text_last) exit; 
var xx = GUI_W/2;
var yy = GUI_H/2-64;
var scale = 1.5;
var off = 2.5;

draw_set_halign(fa_middle);
draw_set_valign(fa_center);


draw_text_transformed_color(xx+off,yy+off,text[current_text],scale,scale,0,c_black,c_black,c_black,c_black,current_alpha);

draw_text_transformed_color(xx,yy,text[current_text],scale,scale,0,c_white,c_white,c_white,c_white,current_alpha);


draw_set_halign(fa_left);
draw_set_valign(fa_top);



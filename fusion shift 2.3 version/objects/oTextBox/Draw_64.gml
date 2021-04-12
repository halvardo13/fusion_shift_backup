var halfw = w * 0.5;

//Draw the box
var xx = xDraw;
var yy = yDraw;


draw_set_color(c_black);
draw_set_alpha(0.65);

draw_roundrect_ext(xx-halfw-border,yy-h-(border*2),xx+halfw+border,yy,rect_radius,rect_radius,false);
//draw_sprite(sTextBoxMarker,0,xx,yy);

draw_set_color(c_white);
draw_set_alpha(1);

//Draw text
DrawSetupText(fMain,c_white,fa_center,fa_top);
draw_text(xx,yy-h-border,string(text_current));



DrawResetText();
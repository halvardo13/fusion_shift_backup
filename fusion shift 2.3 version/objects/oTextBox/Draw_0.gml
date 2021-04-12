/*var halfw = w * 0.5;



//Draw the box
draw_set_color(c_black);
draw_set_alpha(0.5);

draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false);
draw_sprite(sTextBoxMarker,0,x,y);

draw_set_color(c_white);
draw_set_alpha(1);

//Draw text
DrawSetupText(fMainSign,c_white,fa_center,fa_top);
draw_text(x,y-h-border,string(text_current));



DrawResetText();
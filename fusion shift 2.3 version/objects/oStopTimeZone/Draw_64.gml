if (global.game_pause == true) exit;

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(fMain);

var txtXX = 128;
var txtYY = 32;
var txtScale = 1.5;
var txtOff = 3;

var off = 4;
var str = "Eliminate all " +string(global.enemyCount) +" enemies!";
if (global.enemyCount == 1) str = "Eliminate " +string(global.enemyCount) +" enemy!"
if (global.gameMode == "score") str = "Survive!";
if (room == rmLvl_1_9) str = "Defeate the Captain!";

draw_set_color(c_black);
draw_text_transformed(GUI_W/2+off,(GUI_H/2)-96+off,str,s,s,0);


draw_set_color(c_white);

draw_text_transformed(GUI_W/2,(GUI_H/2)-96,str,s,s,0);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);

var txtOff = 3.5;

draw_text_transformed_color(txtXX+txtOff,txtYY+txtOff,place_name,txtScale,txtScale,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(txtXX,txtYY,place_name,txtScale,txtScale,0,c_white,c_white,c_white,c_white,1);

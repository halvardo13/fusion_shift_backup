


var progress = global.game_progression/27 * 100;
if (room != rMenu) exit;
if (oMainMenu.page == 0) exit;
var yMarg = 32;;
var off = 2.4;

draw_set_color(c_black);
draw_text(32+off,32+off,"-Game progress: " +string(progress) +"%");

draw_set_color(c_white);
draw_text(32,32,"-Game progress: " +string(progress) +"%");

draw_set_color(c_black);
draw_text_transformed(32+off,32+yMarg+off,"-Gauntlet highscore: " +string_repeat("0", 5-string_length(string(global.high_scr))) +string(global.high_scr),1,1,0);

draw_set_color(c_white);
draw_text_transformed(32,32+yMarg,"-Gauntlet highscore: " +string_repeat("0", 5-string_length(string(global.high_scr))) +string(global.high_scr),1,1,0);
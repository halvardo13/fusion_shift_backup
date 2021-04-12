if (room == rMenu) exit;

draw_set_color(c_black);
var size = blackbar_size;

draw_rectangle(0,0,GUI_W,size,false);
draw_rectangle(0,GUI_H-size,GUI_W,GUI_H,false);

draw_set_color(c_white);

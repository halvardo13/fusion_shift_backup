randomise();

//draw_text(16,16,string(display_get_width()));
//draw_text(16,32,string(display_get_height()));


//Setup view and window
view_width = 320;
view_heigth = 180;
follow = oPlayer;

camera_buff = 32;
window_scale = 4;
blackbar_size = 0;


window_set_size(view_width*window_scale,view_heigth*window_scale);
alarm[0] = 1;//Center window after setting size

surface_resize(application_surface,view_width*window_scale,view_heigth*window_scale);

//Setup Macros
#macro view view_camera[0]

#macro GUI_SCALE 4
#macro GUI_W 320 * GUI_SCALE
#macro GUI_H 180 * GUI_SCALE

//Positions
xPos = 32;
yPos = 32;

//Screen Shake
screen_shake_legth = 0;
screen_shake_strength = 0;
screen_shake_remain = 0;


//Cutscene mode
//cs_ = ???;




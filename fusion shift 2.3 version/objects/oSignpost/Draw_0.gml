draw_self();
if (global.myDebug == true) draw_circle(x,y,read_range,true);

if (global.game_pause == false) and (global.timeStop == false) alpha = Wave(0,alpha_to,1.6,0);
ChooseColor(255,255,255,alpha);

draw_sprite(sprite_index,0,x,y);
shader_reset();
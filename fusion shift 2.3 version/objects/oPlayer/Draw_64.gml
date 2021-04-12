//Alpha
if (energy_current == 100) {
	e_alpha = max(e_alpha - 0.075,0);	
}
else {
	e_alpha = min(e_alpha + 0.25,e_alpha_set);	
}

//Draw circle
//if (global.gameMode == "level") exit;
draw_set_color(c_col);
draw_set_alpha(e_alpha);
//var precentage = energy_current / 100;
//var xx = 42;
//var yy = 42;
//var r = 32;
//var c = merge_color(c_red,c_green,precentage);

draw_set_color(c_black);
//draw_circle(xx-1,yy-1,r+4,false);


//DrawPie(xx,yy,energy_current,100,c,r,e_alpha);
draw_set_color(c_white);


//var c = merge_color(c_red,c_green,precentage);
//draw_circle_color(42,96,32*precentage,c,c,false);


draw_set_alpha(1);

//HP
/*
var xx = 16;
var yy = 16 + choose(hp_bar_shake,-hp_bar_shake);
var scale = 2.5;
var pixelLength = (sprite_get_width(sHealthBarItem)) * scale;

draw_sprite_ext(sHealthBarFrame,0,xx,yy,scale,scale,0,c_white,1);

for (var i = 0; i <= hp_max;i++) {
	var x_offset = pixelLength * i;
	var sprite = sHealthBarItem;
	if (i > hp) sprite = sHealthBarItem_noone;
	
	draw_sprite_ext(sprite,0,xx + x_offset,yy,scale,scale,0,c_white,1);	
	
}

if (hp_1Up > 0) {
	var xx = (pixelLength * 3) + 32;
	var yy = 16;
	var off = 2;
	draw_set_alpha(hp_1Up);
	draw_set_color(c_black);
	draw_text_transformed(xx+off,yy+off,"1 UP!",2,2,0);
	draw_set_color(c_white);
	draw_text_transformed(xx,yy,"1 UP!",2,2,0);
	draw_set_alpha(1);
}
















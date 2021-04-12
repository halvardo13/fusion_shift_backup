

draw_set_font(fMain);
//draw_text(16,128,"x: " +string(device_mouse_x_to_gui(0)));
//draw_text(16,148,"y: " +string(device_mouse_y_to_gui(0)));


	//draw_text(200,128,string(global.game_progression));
	//draw_text(200,128+32,string(global.hardcore_mode));
//draw_text(64,64,string(levelTargetTime));
//var test = instance_number(pEnemy);
//draw_text(16,16,string(test));

if (global.hardcore_mode == true) and (room != rMenu) {

	draw_text(32,32,string(global.hardcore_mode_timer));

}

//Screen flash 
if (screen_flash != 0) {
	draw_set_alpha(screen_flash);
	draw_rectangle(0,0,GUI_W,GUI_H,false);
	
	draw_set_alpha(1);
}


	var timer = levelTimer;
	//var t2c = "";
	if (levelTimer >= 60*60) {
		//timer = timer/room_speed;
		//var fracValue = frac(levelTimer / room_speed);
		//var t2 = string(fracValue);
		//var t2c = string_replace(t2,"0.",".");
	
	}
	
//Level complete
if (levelComplete == true) and (room != rMenu) and (oTransition.percent == 0) {	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);	
	var xx = GUI_W/2;
	var yy = GUI_H/2-128;
	var off = 4;
	var col = c_black;
	var str = "Level Complete!";
	var str2 = "";
	var a = lc_angle;
	if (lc_scale == 2) a = lc_angle2;
	if (lc_angle2 == 0) var str2 = "Total Time: " +string(timer/room_speed);
	draw_text_transformed_color(xx+off,yy+off,str,lc_scaleX,lc_scale,lc_angle,col,col,col,col,lc_alpha);

	draw_text_transformed_color(xx+off,yy+off,str,lc_scale,lc_scale,a,col,col,col,col,1);

	draw_text_transformed_color(xx+off,(yy+42)+off,str2,lc_scale,lc_scale,a,col,col,col,col,1);

	var col = c_white;
	draw_text_transformed_color(xx+off,yy+off,str,lc_scaleX,lc_scale,lc_angle,col,col,col,col,lc_alpha);
	
	draw_text_transformed_color(xx,yy,str,lc_scale,lc_scale,a,col,col,col,col,1);
	
	draw_text_transformed_color(xx,yy+42,str2,lc_scale,lc_scale,a,col,col,col,col,1);

}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Player GUI
if (room != rMenu) {
	var GUIxx = 48;
	var GUIyy = GUI_H - 112;
	var xxend = GUIxx + 128;
	var yyend = GUIyy + 32;
	
	var GUI2xx = GUIxx;
	var GUI2yy = GUIyy + 36;
	var yyend2 = GUI2yy +32;
	
	var percentReal = ((hp_gui_real * hp_gui_max) / 100) / 100;
	var percentFake = ((hp_gui_fake * hp_gui_max) / 100) / 100;
	var c = make_color_rgb(255,0,68);
	var c2 = make_color_rgb(255,255,255);
	var cback = make_color_rgb(38,43,68);
	draw_set_color(c_white);
	draw_set_alpha(hp_bar_alpha);
	if (instance_exists(oPlayer)) {
		oPlayer.hp_show = 100;
		if (fail_state == true) oPlayer.hp_show = 0;
		if (oPlayer.target == true) hp_gui_max = oPlayer.hp_show; hp_gui_fake = oPlayer.hp_show; hp_gui_real = oPlayer.hp_show;
		
	}
	
	draw_healthbar(GUIxx,GUIyy,xxend,yyend,hp_gui_max*percentFake,cback,c2,c2,0,1,0);//Hp bar
	draw_healthbar(GUIxx,GUIyy,xxend,yyend,hp_gui_max*percentReal,c,c,c,0,0,0);//Hp Bar
	
	draw_set_alpha(1);
	var percent2 = ((oPlayer.energy_current * 100) / 100) / 100;
	var c22 = make_color_rgb(245,174,52);

	draw_healthbar(GUI2xx,GUI2yy,xxend,yyend2,100*percent2,cback,c22,c22,0,1,0); //Time Bar
	
	//Health bar sprite
	draw_set_alpha(hp_bar_alpha);
	draw_sprite(sHealthBar,0,GUIxx-2,GUIyy);
	draw_sprite_ext(sHealthHart,0,GUIxx+16,GUIyy+12,3*hp_icon_wave,3*hp_icon_wave,0,c_white,hp_bar_alpha);
	
	if (global.game_pause == false) and (global.timeStop == false) {
		if (oPlayer.target == false) hp_icon_wave = Wave(0.85,1.25,3,0);
		else hp_icon_wave = 1;
	}
	else hp_icon_wave = 1;
	
	//Time Bar sprite
	draw_set_alpha(1);
	draw_sprite(sHealthBar,0,GUI2xx-2,GUI2yy);
	draw_sprite_ext(sClock,0,GUI2xx+16,GUI2yy+13.4,3,3,0,c_white,1);
	
	//Enemy Count
	draw_sprite(sEnemyCount,0,GUIxx,GUIyy - 36);
	draw_sprite_ext(sEnemyCountSymbol,0,GUIxx+18,GUIyy-24,3,3,0,c_white,1);
	
	draw_text_color(GUIxx + 34+2,GUIyy - 30+2,": "+string(global.enemyCount),c_black,c_black,c_black,c_black,1);
	
	draw_text(GUIxx + 34,GUIyy - 30,": "+string(global.enemyCount));
	
	//Stop Time Effect
	if (global.timeStop == true) {
		time_stop_alpha = Approach(time_stop_alpha,time_stop_alpha_max,time_stop_alpha_spd);
	}
	else {
		time_stop_alpha = Approach(time_stop_alpha,0,time_stop_alpha_spd);
	}
	//var tsaScale = 4 * GUI_SCALE;
	//draw_sprite_ext(sOverlay,0,0,0,tsaScale,tsaScale,0,c_white,time_stop_alpha);
}
if (player_invs_alpha != 0) {
	draw_text(32,96,"player invs = " +string(global.player_invs));
	player_invs_alpha = Approach(player_invs_alpha,0,0.05);

}
//Score
if (global.gameMode == "score") and (fail_state == false) and (room != rMenu) {
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	var off = 4;
	var str = "Score: ";
	if (fail_state == true) str = "Score: ";

	draw_text_transformed((GUI_W - 128)+off,32+off,str +string_repeat("0", 5-string_length(string(global.scr))) +string(global.scr),scr_scale,scr_scale,0);
	draw_set_color(c_white);

	draw_text_transformed((GUI_W - 128),32,str +string_repeat("0", 5-string_length(string(global.scr))) +string(global.scr),scr_scale,scr_scale,0);


	scr_scale = max(scr_scale - 0.1,1.6);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);



	//Combo
	draw_set_halign(fa_middle);
	draw_set_valign(fa_bottom);
	var scale = 3 * comboScale;
	var xx = GUI_W - 64;
	var yy = 128;
	var off = 4;
	var str = "X";

	draw_set_color(c_black);
	draw_text_transformed((xx)+off,(yy)+off,string(comboCount) +str,scale,scale,0);

	draw_set_color(c_gray);
	draw_text_transformed(xx,yy,string(comboCount) +str,scale,scale,0);

	draw_set_alpha(comboPercent);
	draw_set_color(c_black);
	draw_text_transformed((xx)+off,(yy)+off,string(comboCount) +str,scale,scale,0);

	draw_set_color(c_white);
	draw_text_transformed(xx,yy,string(comboCount) +str,scale,scale,0);


	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

}
/*gpu_set_blendmode(bm_add);
draw_sprite_ext(sFilter2,0,0,0,1,1,0,c_white,1.15);
gpu_set_blendmode(bm_normal);
*/


//Pause Menu
if (global.game_pause == true) and (room != rMenu) and (oTransition.percent == 0) and (oCamera.blackbar_size == 0) and (room != rSpace) and (fail_state == false) {
	var xRec1 = 0;
	var yRec1 = GUI_H/2-96;
	var xRec2 = GUI_W;
	var yRec2 = GUI_H/2+96;
	draw_set_alpha(0.4);
	draw_set_color(c_black);

	//Draw Rec
	draw_rectangle(xRec1,yRec1,xRec2,yRec2,false);
	draw_set_alpha(1);
	
	//Draw Lines
	draw_set_color(c_black);
	var w = 4;
	draw_line_width(0,yRec1,xRec2,yRec1,w);
	draw_line_width(0,yRec2,xRec2,yRec2,w);
	
	//Draw menu items
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);

	var xx = GUI_W/2;
	var yy = yRec1 + 48;

	var menu = mainItems;
	var courser = mainCourser
	var array = main;
	if (menu_set == 1) {
		var menu = opItems;
		var courser = opCourser
		var array = op;
	}

	for (var i = 0;i <= menu;i++) {
		var off = 4;
		var yMarg = 48*i;
		var c = c_white;
		var scale = 2.4;
		if (i != courser) {
			c = c_gray;
			scale = 2;	
		}
		draw_set_color(c_black);
		draw_text_transformed(xx+off,(yy + yMarg)+off,array[i],scale,scale,0);
		
		draw_set_color(c);
		draw_text_transformed(xx,yy + yMarg,array[i],scale,scale,0);
		
	}

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text(16+2,(GUI_H - 32)+2,"Version: " +string(GM_version));
	draw_text(174+2,(GUI_H - 32)+2,"gamemode: " +string(global.gameMode));
	draw_set_color(c_white);
	draw_text(16,GUI_H - 32,"Version: " +string(GM_version));
	draw_text(174,GUI_H - 32,"gamemode: " +string(global.gameMode));
}
#region//
if (room == rMenu) {
	//var steam_str = "Steam API not connected";
	//if (global.steamAPI == true) {
	//	steam_str = "Steam API connected";
	//}
	
	//draw_set_color(c_black);
	//draw_text(16+2,(GUI_H - 32)+2,"Version: " +string(GM_version));
	//draw_text(174+2,(GUI_H - 32)+2,"gamemode: " +string(global.gameMode));
	//draw_text(374+2,(GUI_H - 32)+2,"Steam connection: " +steam_str);
	
	//draw_set_color(c_white);
	//draw_text(16,GUI_H - 32,"Version: " +string(GM_version));
	//draw_text(174,GUI_H - 32,"gamemode: " +string(global.gameMode));
	//draw_text(374,GUI_H - 32,"Steam connection: " +steam_str);
}
#endregion


//Failstate Gauntlet mode
if (fail_state == true) and (gauntlet_hold_restart == true) and (global.gameMode == "score") {
	var xx = GUI_W/2;
	var yy = GUI_H/2-128;
	var scale = 2;
	var off = 2.5;
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	
	var yMove = 42;
	
	draw_text_transformed_color(xx+off,yy+off,"Score: " +string(global.scr),scale,scale,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(xx,yy,"Score: " +string(global.scr),scale,scale,0);
	
	draw_text_transformed_color(xx+off,yy+yMove+off,"Highscore: " +string(global.high_scr),scale,scale,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(xx,yy+yMove,"Highscore: " +string(global.high_scr),scale,scale,0);
	if (new_highscore == true) {
		draw_text_transformed_color(xx+off,yy+off-yMove*2,"New Highscore set",scale,scale,0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(xx,yy-yMove*2,"New Highscore set",scale,scale,0);
	
	}
	draw_text_transformed_color(xx+off,yy+off+yMove*3,"Press 'Space' to restart",scale,scale,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(xx,yy+yMove*3,"Press 'Space' to restart",scale,scale,0);
	
	draw_text_transformed_color(xx+off,yy+off+yMove*4,"Press 'Q ' to exit",scale,scale,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(xx,yy+yMove*4,"Press 'Q ' to exit",scale,scale,0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}




//My debug
if (global.myDebug == true) {
	draw_set_font(fDebug);
	draw_text(GUI_W-332,16,"debug_screen\nF1 to toggle");
	
	var off = 16;
	draw_text(GUI_W-128,off,"fps:" +string(fps));
	draw_text(GUI_W-128,off*2,"fps_real:" +string(fps_real));
	draw_text(GUI_W-128,off*3,"timer:" +string(levelTimer/room_speed));

	var off2 = 16;
	draw_text(GUI_W-192,112,"button up: "+ string(key[global.c_up]));
	draw_text(GUI_W-192,112+off2,"button left: "+ string(key[global.c_left]));
	draw_text(GUI_W-192,112+off2*2,"button down: "+ string(key[global.c_down]));
	draw_text(GUI_W-192,112+off*3,"button right: "+ string(key[global.c_right]));
	
	draw_text(GUI_W-192,112+off*5,"button jump: "+ string(key[global.c_jump]));
	draw_text(GUI_W-192,112+off*6,"button take over: "+ string(key[global.c_take_over]));
	
	draw_text(GUI_W-192,112+off*8,"SFX gain: "+ string(global.SFX_gain));
	draw_text(GUI_W-192,112+off*9,"MUSIC gain: "+ string(global.MUSIC_gain));
}



draw_set_font(fMain);



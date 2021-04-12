//Draw game logo
var xx = GUI_W/2;
var yy = GUI_H/2-128;
var logoScale = 2;

if (logoDissolve < 1) {
	DissolveShader(sMainLogo,0,xx,yy,logoScale,logoScale,0,c_white,1,logoDissolve);
}
else {
	draw_sprite_ext(sMainLogo,0,xx,yy,logoScale,logoScale,0,c_white,1);	
	if (logoFlash > 0) {
		ChooseColor(255,255,255,logoFlash);
		draw_sprite_ext(sMainLogo,0,xx,yy,logoScale,logoScale,0,c_white,1);	
		logoFlash = Approach(logoFlash,0,0.025);
		shader_reset();
	}
}

var stat_xx = 0;
var stat_yy = 0;

//Setp draw menu
var xx = GUI_W/2;
var yy = GUI_H/2 - 64;
var scale = text_scale;
var outline = 3;
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
set_alpha = 1;

var level_name = "";

//Draw Menu
for(var i = 1; i <= menu_entry[page,0]; i++) {
	var str = menu_entry[page,i];
	//Set margin
	var margin = 32 * i;
	
	//Choose color
	var col = c_gray;
	if (i == menu_courser) {
		var level_name = str;
		var scale = rebind_scale;
		var col = c_white;
		str = string_insert(">",str,0);	
		var stat_xx = xx;
		var stat_yy = yy;//+ margin;
		
		if (rebind == true) set_alpha = rebind_alpha;
	}
	else {
		set_alpha = 1;
		var scale = text_scale;
	}
	if (!instance_exists(oGameStartup)) {
		//Draw Outline The Text
		draw_text_transformed_color(xx+outline,(yy + margin)+outline,str,scale,scale,0,c_black,c_black,c_black,c_black,set_alpha);
	
		//Draw Real The Text
		draw_text_transformed_color(xx,yy + margin,str,scale,scale,0,col,col,col,col,set_alpha);
	
	}
}

//Draw change audio
if (page == 8) {
	//Pos sfx
	var sfxXX = GUI_W/2 + 42;
	var sfxYY = GUI_H/2 - 42;
	//Pos music
	var musicXX = GUI_W/2 + 42;
	var musicYY = GUI_H/2 - 8;
	//Draw SFX
	for (var i = 1; i <= 10; i++) {
		var xOff = 10*i;
		var sub = 1;
		if (global.gain_SFX >= i) sub = 0;
		
		draw_sprite(sMenuAudio,sub,sfxXX+xOff,sfxYY);
		
	
	}
	//Draw MUSIC
	for (var i = 1; i <= 10; i++) {
		var xOff = 10*i;
		var sub = 1;
		if (global.gain_MUSIC >= i) sub = 0;
		
		draw_sprite(sMenuAudio,sub,musicXX+xOff,musicYY);
		
	
	}
	var off = 1.2;
	draw_text_transformed_color((sfxXX+134) + off,sfxYY + off,string(global.SFX_gain * 100) +"%",0.8,0.8,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(sfxXX+134,sfxYY,string(global.SFX_gain * 100) +"%",0.8,0.8,0);
	
	draw_text_transformed_color((musicXX+134) + off,musicYY + off,string(global.MUSIC_gain * 100) +"%",0.8,0.8,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(musicXX+134,musicYY,string(global.MUSIC_gain * 100) +"%",0.8,0.8,0);
}

//Credits
if (page == 9) {
	var creditsXX = GUI_W/2;
	var creditsYY = GUI_H/2-12;
	var creditsYY2 = GUI_H/2+42;
	var creditsSTR = "Game developed by: halvardo13";
	var creditsSTR2 = "Made with: Game Maker Studio 2";
		
		
	draw_text_transformed_color(creditsXX+outline,(creditsYY + margin)+outline,creditsSTR,scale,scale,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(creditsXX+outline,(creditsYY2 + margin)+outline,creditsSTR2,scale,scale,0,c_black,c_black,c_black,c_black,1);
		
	draw_text_transformed_color(creditsXX,creditsYY + margin,creditsSTR,scale,scale,0,col,col,col,col,set_alpha);
	draw_text_transformed_color(creditsXX,creditsYY2 + margin,creditsSTR2,scale,scale,0,col,col,col,col,set_alpha);
}


//Reset Draw
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Draw keyboard sprites
var scale = 2.5;
var offset = 2.5;
var xx = 32;
var yy = GUI_H - 160;
var marg = 18*scale;
var str = "Move             Select";

draw_sprite_ext(sKey_w,0,xx+(marg),yy-18*scale,scale,scale,0,c_white,1);
draw_sprite_ext(sKey_a,0,xx,yy,scale,scale,0,c_white,1);
draw_sprite_ext(sKey_s,0,xx+(marg),yy,scale,scale,0,c_white,1);
draw_sprite_ext(sKey_d,0,xx+(marg*2),yy,scale,scale,0,c_white,1);
draw_sprite_ext(sKey_space,0,+(marg*4)-16,yy,scale,scale,0,c_white,1);

draw_text_color(xx+42+offset,(yy+18*scale)+offset,string(str),c_black,c_black,c_black,c_black,1);
draw_text_color(xx+42,(yy+18*scale),string(str),c_white,c_white,c_white,c_white,1);

//
if (page == 1) and (menu_courser == 5) {
	stat_xx = stat_xx + 80;
	stat_yy = stat_yy  + 12;

	var rec_alpha = 0.4;
	var rec_end_xx = stat_xx + 254;
	var rec_end_yy = stat_yy + 96;
	
	//Draw rectangle
	draw_set_alpha(rec_alpha);
	draw_roundrect_color_ext(stat_xx,stat_yy,rec_end_xx,rec_end_yy,16,16,c_black,c_black,false);

	draw_set_alpha(1);

	var txt_scale = 1;
	var txt_xx = stat_xx + 10;
	var txt_yy = stat_yy + 10;
	
	var unlock_status = "Mode Locked.";
	if (global.game_complete == true) {
		var unlock_status = "Mode Unlocked.";
	}
	var best_time = "Best Time: Not Completed.";
	if (global.stat_best_hardcore_time != 0) {
		var time = (global.stat_best_hardcore_time/60)/60;
		var best_time = "Best Time: " +string(time) +" min.";
	
	}
	draw_text(txt_xx,txt_yy,unlock_status);
	draw_text(txt_xx,txt_yy+24,best_time);
}

//Draw stats
if (page == 10) and (menu_courser == 1) {
	stat_xx = stat_xx + 80;
	stat_yy = stat_yy  + 12;

	var rec_alpha = 0.4;
	var rec_end_xx = stat_xx + 232;
	var rec_end_yy = stat_yy + 96;
	
	//Draw rectangle
	draw_set_alpha(rec_alpha);
	draw_roundrect_color_ext(stat_xx,stat_yy,rec_end_xx,rec_end_yy,16,16,c_black,c_black,false);

	draw_set_alpha(1);

	//Setup text
	var txt_scale = 1;
	var txt_xx = stat_xx + 10;
	var txt_yy = stat_yy + 10;
	
	for (var i = 0; i <= stat_count;i++) {
		var yyyy = 24*i;
		//Find stat
		var st = "";
		if (i == 0) var st = global.stat_total_kills;
		if (i == 1) var st = global.stat_total_deaths;
		
		//Draw
		draw_text(txt_xx,txt_yy+yyyy,stat[i] +string(st));


	}
}



if (page == 2) or (page == 3) or (page == 4) {
	
}
else exit;
if (menu_courser == 10) exit;

//Setup level stats
stat_xx = stat_xx + 80;
stat_yy = stat_yy  + 12;

var rec_alpha = 0.4;
var rec_end_xx = stat_xx + 232;
var rec_end_yy = stat_yy + 96;

//Draw rectangle
draw_set_alpha(rec_alpha);
draw_roundrect_color_ext(stat_xx,stat_yy,rec_end_xx,rec_end_yy,16,16,c_black,c_black,false);

draw_set_alpha(1);

//Setup text
var txt_scale = 1;
var txt_xx = stat_xx + 10;
var txt_yy = stat_yy + 10;

//Find correct world and level
var best_time = MenuFindTime();
var sec = " Sec.";
if (best_time == 0) {
	var best_time = "Not played";
	var sec = "";
}
if (CheckLevel(page,menu_courser) == true) {
	var lock_str = "Level Unlocked";
	var sub = 1;
}
else {
	var lock_str = "Level Locked";
	var sub = 0;	
}


//Draw level stats
var yMarg = 24;
draw_text_transformed(txt_xx,txt_yy,level_name,txt_scale,txt_scale,0);
draw_text_transformed(txt_xx,txt_yy+yMarg,lock_str,txt_scale,txt_scale,0);
draw_sprite_ext(sLevelLock,sub,txt_xx + 160,txt_yy+yMarg,3,3,0,c_white,1);
draw_text_transformed(txt_xx,txt_yy+yMarg*2,"Best time: " +string(best_time) +sec,txt_scale,txt_scale,0);





















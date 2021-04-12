///@desc Enemy health bar
function EnemyHealthBar() {
	if (controled == false) {
		hp_fake = Approach(hp_fake,hp,0.55);
		var xx = x-10;
		var yy = y - 18;
		var xxend = xx+18;
		var yyend = yy + 4;
		var percentReal = ((hp / hp_max) * 100)
		var percentFake = ((hp_fake / hp_max) * 100);
		var c = make_color_rgb(255,0,68);
		var c2 = make_color_rgb(255,255,255);
		var cback = make_color_rgb(38,43,68);
		hp_bar_alpha = max(hp_bar_alpha - 0.03,0);
		draw_set_alpha(hp_bar_alpha);


		draw_healthbar(xx,yy,xxend,yyend,percentFake,cback,c2,c2,0,1,0);
		draw_healthbar(xx,yy,xxend,yyend,percentReal,cback,c,c,0,0,0);


		draw_sprite(sHealthBarEnemies,0,xx,yy);
	
		draw_set_alpha(1);
		if (global.game_pause == true) or (global.timeStop == true) {
		
		}
		else {
			sheild_scale = Wave(1,1.4,0.8,0);
		}
		if (sheild == true) draw_sprite_ext(sSheildLogo,0,xx+24,yy,sheild_scale,sheild_scale,0,c_white,1);
	}


}

if (global.game_pause == true) {
	exit;	
}

x = oPirateBoss.x;
y = oPirateBoss.y;

if (hp <= 0) instance_destroy();

var hpPercent = ((hp / hp_max) * 100);

if (hpPercent <= 75) subimg = 1;
if (hpPercent <= 50) subimg = 2;
if (hpPercent <= 25) subimg = 3;




UpdateAchievementList();


current_alpha_set = -0.3;
current_alpha = current_alpha_set;
alpha_tic = 2;
current_text = 0;
spd = 0.005;

if (global.hardcore_mode_timer < global.stat_best_hardcore_time) global.stat_best_hardcore_time = global.hardcore_mode_timer;
if (global.stat_best_hardcore_time == 0) global.stat_best_hardcore_time = global.hardcore_mode_timer;
  
var cur_t = (global.hardcore_mode_timer/60)/60;
var b_t = (global.stat_best_hardcore_time/60)/60;
  
if (global.hardcore_mode == false) {
	text[0] = "Game Complete!";
	text[1] = "Developed by Halvard Mjelde";
	text[2] = "Thank you for playing!";

	text_last = 3;

}
else {
	text[0] = "Game Complete!";
	text[1] = "You completed hardcore mode";
	text[2] = "Your time: "+string(cur_t) +string(" min");
	text[3] = "Your best time: "+string(b_t) +string(" min");

	text_last = 4;	
}

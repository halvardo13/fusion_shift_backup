goto_gauntlet = false;
gamepad_connected = true;

new_highscore = false;

//Display Name!
window_set_caption("Fusion SHIFT - Version: "+string(GM_version));


if (debug_mode == false) randomise();

playerXFailState = 0;

gauntlet_hold_restart = true;

fail_state = false;
reset_level_timer_set = 60;
reset_level_timer = reset_level_timer_set;

screen_flash = 0;

enemyCountAlphaSet = 2.4;
enemyCountAlpha = enemyCountAlphaSet;

levelTimer = 0;
levelComplete = false;
levelTargetTime = 0;


lc_angle = 14;
lc_angle2 = -6;
lc_scale = 4;
lc_scaleX = 4;
lc_alpha = 1;
lc_shake = true;

scr_scale = 1;

spawnerBuffSet = 120;
spawnerBuff = spawnerBuffSet;

time_stop_alpha = 0;
time_stop_alpha_spd = 0.01;
time_stop_alpha_max = 0.15;

//Level Start
level_end_check_marg_set = 5;
level_end_check_marg = level_end_check_marg_set;
start_level = false;

//hold_level_complete = false;

num = random(10000);

//Pause Menu
menu_set = 0;
mainCourser = 0;
mainItems = 2;

main[0] = "Resume";
main[1] = "Exit to menu";
main[2] = "Exit to desktop";

//Options
opCourser = 0;
opItems = 2;

op[0] = "Toggle fullscreen";
op[1] = "Back";
op[2] = "";

//menu_x = GUI_W/2;
menu_y = GUI_H/2-96;
menu_font_heigth = (font_get_size(fMain)*2.4);
menu_bottom = menu_y + ((menu_font_heigth * 2) * (mainItems+1));

//HP
hp_gui_max = 100;
hp_gui_real = 100;
hp_gui_fake = 100;

hp_bar_alpha = 1;

hp_icon_wave = 1;

player_invs_alpha = 0;

//Combo
comboAdd = false;
comboCount = 0;
comboPercent = 0;
comboSet = 1.8;
comboScale = 1;
combo5 = 0;

global.game_complete = false;
global.startup_happed = false;

//Player stats 
global.stat_total_kills = 0;
global.stat_total_deaths = 0;
global.stat_best_hardcore_time = 0;



//Controls
global.c_up = ord("W");
global.c_down = ord("S");

global.c_left = ord("A");
global.c_right = ord("D");

global.c_jump = vk_space;
global.c_take_over = vk_lshift;

//Time Stop
global.decrease_time = 1.25;
global.increase_time = 0.25;
global.regen_timer = 180;

//Damage
global.damage_ar = 25;
global.damage_smg = 20;
global.damage_pirate = 30;
global.damage_bow = 100;
global.damage_mage = 55;

global.can_damage_timer = 6; //Frame count where bullets can not damage after being created

//Gameplay Settings
global.ss_stength = 1;
global.has_aim_assist = true;
global.enemy_grv_normal = 0.1;
global.enemy_grv = global.enemy_grv_normal;
global.moon_grv = 0.06;
global.enemy_grv_max_dwn_spd = 5;




global.hardcore_mode = false;
global.hardcore_mode_timer = 0;



//Global Vars
global.game_pause = false;

global.enemyTakeOverRange = 18;
global.enemyCount = 0;
global.spawnerCount = 0;

global.timeStop = false;
global.time = 1; 

global.scr = 0; //Score
global.high_scr = 0;

global.gameMode = "noone";

global.steamAPI = false;
var steamACTIVE = steam_initialised();
if (steamACTIVE == true) global.steamAPI = true;

//Debug help
global.myDebug = false;

global.player_invs = false;
//global.player_full_invs = false;

//controller 
global.controller_use = false;
global.controller_device = 4;       //gamepad_is_connected(numb);
global.controllerAngle = 0;
//Gameplay effects
global.wind_effect = true;
global.wind_strenght = 1;


//Button Mapping (keyboard)
/*
global.keyboard_up = ;
global.keyboard_down = ;
global.keyboard_left = ;
global.keyboard_right = ;
global.keyboard_jump = ;
global.keyboard_timeStop = ;
*/

#region ASCII 
key[9] = "Tab";
key[8] = "Backspace";
key[160] = "Left Shift";
key[162] = "Left Control";
key[164] = "Left Alt";
key[165] = "Right Alt";
key[92] = "Right Windows Key";
key[163] = "Right Control";
key[161] = "Right Shift";

key[13] = "Enter";

key[16] = "Shift";
key[17] = "Control";
key[18] = "Alt";
key[19] = "Pause";
key[20] = "Capslock";

key[32] = "Space";
key[33] = "Page up";
key[34] = "Page down";
key[35] = "End";
key[36] = "Home";

// key[27] = "Escape" // cant be used because its used to exit this menu

key[37] = "Left";
key[38] = "Up";
key[39] = "Right";
key[40] = "Down";

key[45] = "Insert";
key[46] = "Delete";

key[48] = "0";
key[49] = "1";
key[50] = "2";
key[51] = "3";
key[52] = "4";
key[53] = "5";
key[54] = "6";
key[55] = "7";
key[56] = "8";
key[57] = "9";

key[65] = "A";
key[66] = "B";
key[67] = "C";
key[68] = "D";
key[69] = "E";
key[70] = "F";
key[71] = "G";
key[72] = "H";
key[73] = "I";
key[74] = "J";
key[75] = "K";
key[76] = "L";
key[77] = "M";
key[78] = "N";
key[79] = "O";
key[80] = "P";
key[81] = "Q";
key[82] = "R";
key[83] = "S";
key[84] = "T";
key[85] = "U";
key[86] = "V";
key[87] = "W";
key[88] = "X";
key[89] = "Y";
key[90] = "Z";
key[91] = "Windows Key";

key[93] = "Context Menu";

key[96] = "Num 0";
key[97] = "Num 1";
key[98] = "Num 2";
key[99] = "Num 3";
key[100] = "Num 4";
key[101] = "Num 5";
key[102] = "Num 6";
key[103] = "Num 7";
key[104] = "Num 8";
key[105] = "Num 9";

key[106] = "Num *";
key[107] = "Num +";
key[109] = "Num -";
key[110] = "Num .";
key[111] = "Num /";


key[112] = "F1";
key[113] = "F2";
key[114] = "F3";
key[115] = "F4"; // was left black
key[116] = "F5"; // was left black
key[117] = "F6"; // was left black
key[118] = "F7";
key[119] = "F8";
key[120] = "F9"; // was left black
key[121] = "F10";
key[122] = "F11";
key[123] = "F12"; // was left black

key[144] = "NUMLOCK";

key[186] = ";";
key[187] = "=";
key[188] = ",";
key[189] = "-";
key[190] = ".";
key[191] = "/";
key[192] = "'"; // actually `

key[219] = "[";
key[221] = "]";
key[222] = "\#"; // actually # but that needs to be escaped

key[223] = "`"; // actually # but that needs to be escaped
#endregion



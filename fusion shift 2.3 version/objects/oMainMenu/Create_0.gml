//Menu Setup
menu_courser = 1;
page = 0;
set_alpha = 1;
text_scale = 1.5;

DissolveSettings(sMainLogoDisolve,0,c_red,c_orange,0.2);
logoDissolve = 0;
logoFlash = 1.5;

w = 0;
h = 0;



//Input buffer
input_buffer_max = 24;
input_buffer_min = 10;
input_buffer_reset = input_buffer_max;
input_buffer = 0;
input_buffer_percent = 0.75;

//Page 0
menu_entry[0,0] = 2;
menu_entry[0,1] = "Start Game";
menu_entry[0,2] = "Exit Game";

//Page 1
menu_entry[1,0] = 8;
menu_entry[1,1] = "World 1";
menu_entry[1,2] = "World 2";
menu_entry[1,3] = "World 3";
menu_entry[1,4] = "Gauntlet";
menu_entry[1,5] = "Hardcore Mode";
menu_entry[1,6] = "Settings";
menu_entry[1,7] = "Profile";
menu_entry[1,8] = "Back";

//Page 2 - WORLD 1
menu_entry[2,0] = 10;
menu_entry[2,1] = "Level 1-1";
menu_entry[2,2] = "Level 1-2";
menu_entry[2,3] = "Level 1-3";
menu_entry[2,4] = "Level 1-4";
menu_entry[2,5] = "Level 1-5";
menu_entry[2,6] = "Level 1-6";
menu_entry[2,7] = "Level 1-7";
menu_entry[2,8] = "Level 1-8";
menu_entry[2,9] = "Level 1-9";
menu_entry[2,10] = "Back";

//Page 3 - WORLD 2
menu_entry[3,0] = 10;
menu_entry[3,1] = "Level 2-1";
menu_entry[3,2] = "Level 2-2";
menu_entry[3,3] = "Level 2-3";
menu_entry[3,4] = "Level 2-4";
menu_entry[3,5] = "Level 2-5";
menu_entry[3,6] = "Level 2-6";
menu_entry[3,7] = "Level 2-7";
menu_entry[3,8] = "Level 2-8";
menu_entry[3,9] = "Level 2-9";
menu_entry[3,10] = "Back";

//Page 4 - WORLD 3
menu_entry[4,0] = 10;
menu_entry[4,1] = "Level 3-1";
menu_entry[4,2] = "Level 3-2";
menu_entry[4,3] = "Level 3-3";
menu_entry[4,4] = "Level 3-4";
menu_entry[4,5] = "Level 3-5";
menu_entry[4,6] = "Level 3-6";
menu_entry[4,7] = "Level 3-7";
menu_entry[4,8] = "Level 3-8";
menu_entry[4,9] = "Level 3-9";
menu_entry[4,10] = "Back";

//Page 5 - settings
menu_entry[5,0] = 5;
menu_entry[5,1] = "Controls";
menu_entry[5,2] = "Display";
menu_entry[5,3] = "Audio";
menu_entry[5,4] = "Credits";
menu_entry[5,5] = "Back";

//Page 6 - controls
menu_entry[6,0] = 8;
menu_entry[6,1] = "Button Up: "
menu_entry[6,2] = "Button Left: "
menu_entry[6,3] = "Button Down: "
menu_entry[6,4] = "Button Right: "
menu_entry[6,5] = "Jump/Stop time: "
menu_entry[6,6] = "Take over: "
menu_entry[6,7] = "Default"
menu_entry[6,8] = "Back"

//Page 7 - display
menu_entry[7,0] = 2;
menu_entry[7,1] = "Toggle Fullscreen";
menu_entry[7,2] = "Back";

//Page 8 - audio
menu_entry[8,0] = 3;
menu_entry[8,1] = "SFX";
menu_entry[8,2] = "MUSIC";
menu_entry[8,3] = "Back";

//Page 9 - Credits
menu_entry[9,0] = 1;
menu_entry[9,1] = "Back";

//Page 10 - Profile
menu_entry[10,0] = 2;
menu_entry[10,1] = "Stats";
menu_entry[10,2] = "Back";

//Page 11 - Gauntlet warp
menu_entry[11,0] = 0;


//Button remapping
rebind = false;
rebind_alpha = 0.5;
rebind_scale = text_scale;

key_map = -1;

//Stats 
stat_count = 1;
stat[0] = "Total Kills: ";
stat[1] = "Total Deaths: ";







if (global.startup_happed == true) instance_destroy();


alpha = 0;



if (file_exists("fusion_shift_gamesave.game")) {
	with (oSaveLoad) enter_load_state = true;
	exit;
}

if (!file_exists("fusion_shift_gamesave.game")) {
	with (oSaveLoad) enter_save_state = true;
}

///@desc CheckLevel(Page,courser);
///@arg page
///@arg menu_courser
function CheckLevel(argument0, argument1) {




	if (argument0 == 2) { 
		if (argument1 == 1) {
			if (global.game_progression >= 0) return 1;
		}
		if (argument1 == 2) {
			if (global.game_progression >= 1) return 1;
		}
		if (argument1 == 3) {
			if (global.game_progression >= 2) return 1;	
		}
		if (argument1 == 4) {
			if (global.game_progression >= 3) return 1;
		}
		if (argument1 == 5) {
			if (global.game_progression >= 4) return 1;
		}
		if (argument1 == 6) {
			if (global.game_progression >= 5) return 1;
		}
		if (argument1 == 7) {
			if (global.game_progression >= 6) return 1;
		}
		if (argument1 == 8) {
			if (global.game_progression >= 7) return 1;
		}
		if (argument1 == 9) {
			if (global.game_progression >= 8) return 1;
		}
	}

	if (argument0 == 3) {
		if (argument1 == 1) {
			if (global.game_progression >= 9) return 1;
		}
		if (argument1 == 2) {
			if (global.game_progression >= 10) return 1;	
		}
		if (argument1 == 3) {
			if (global.game_progression >= 11) return 1;
		}
		if (argument1 == 4) {
			if (global.game_progression >= 12) return 1;
		}
		if (argument1 == 5) {
			if (global.game_progression >= 13) return 1;
		}
		if (argument1 == 6) {
			if (global.game_progression >= 14) return 1;
		}
		if (argument1 == 7) {
			if (global.game_progression >= 15) return 1;	
		}
		if (argument1 == 8) {
			if (global.game_progression >= 16) return 1;	
		}
		if (argument1 == 9) {
			if (global.game_progression >= 17) return 1;	
		}
	}

	if (argument0 == 4) {
		if (argument1 == 1) {
			if (global.game_progression >= 18) return 1;
		}
		if (argument1 == 2) {
			if (global.game_progression >= 19) return 1;
		}
		if (argument1 == 3) {
			if (global.game_progression >= 20) return 1;	
		}
		if (argument1 == 4) {
			if (global.game_progression >= 21) return 1;	
		}
		if (argument1 == 5) {
			if (global.game_progression >= 22) return 1;	
		}
		if (argument1 == 6) {
			if (global.game_progression >= 23) return 1;
		}
		if (argument1 == 7) {
			if (global.game_progression >= 24) return 1;	
		}
		if (argument1 == 8) {
			if (global.game_progression >= 25) return 1;	
		}
		if (argument1 == 9) {
			if (global.game_progression >= 26) return 1;	
		}
	}

	return 0;








}

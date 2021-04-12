///DamageActalPlayer
function DamageAcualPlayer() {
	if (global.player_invs = true) exit;

	with (other) {
		if (target == true) or (invs_frames > 0) exit;
		if (global.gameMode == "score") kill_player = true;//energy_current = 0;
		else kill_player = true;
	
	}
	instance_destroy();


}

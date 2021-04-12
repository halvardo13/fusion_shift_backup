function InitiateLevel(argument0, argument1) {
	//InitiateLevel(wind,target_time);
	///@arg wind
	///@arg levelTargetTime

	//Run script in creation code of rooms



	//Reset enemy count alpha 
	with (oGamePlay) {
		enemyCountAlpha = enemyCountAlphaSet;	
	
	
	}

	//Set level target time
	if (argument1 != -1) {
		with (oGamePlay) {
			levelTargetTime = argument1;
		}
	}



	//Reset Gameplay effects
	global.wind_effect = false;

	//Wind Effect
	if (argument0 == true) global.wind_effect = true;


}

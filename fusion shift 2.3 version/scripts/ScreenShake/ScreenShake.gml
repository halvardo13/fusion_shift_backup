///@desc ScreenShake();
///@arg Strength
///@arg Time
function ScreenShake(argument0, argument1) {
	with (oCamera) {
		if (argument0 > screen_shake_remain) {
			screen_shake_strength = argument0*global.ss_stength;	
			screen_shake_remain = argument0*global.ss_stength;	
			screen_shake_legth = argument1;
		}
	}





}

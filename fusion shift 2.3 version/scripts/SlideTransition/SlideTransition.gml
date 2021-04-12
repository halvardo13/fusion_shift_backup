///@desc SlideTransition();
///@arg mode
///@arg target room
function SlideTransition(argument0, argument1) {
	with (oTransition) {
		mode = argument0;
		if (argument1 != noone) {
			target_room = argument1;
		}
	}


}

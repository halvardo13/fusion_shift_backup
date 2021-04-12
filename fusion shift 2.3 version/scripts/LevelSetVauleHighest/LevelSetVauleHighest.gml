///@desc LevelSetValueHighest(variable,value);
///@arg variable
///@arg vaule
function LevelSetVauleHighest(argument0, argument1) {



	if (argument0 == 0) {
		return argument1;	
	}
	else {
		if (argument1 < argument0) {
			return argument1; 
		}
		else {
			return argument0;	
		}
	}



}

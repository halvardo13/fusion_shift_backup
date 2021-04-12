shake = max(shake - shake_length,0);
if (shake == 0) {
	image_angle = 0;
	if (!place_meeting(x,y,oPlayer)) can_shake = true;
}


if (shake > 0) {
	var strength = 1;
	image_angle = 0 + random_range(strength,-strength);	
	
	
}

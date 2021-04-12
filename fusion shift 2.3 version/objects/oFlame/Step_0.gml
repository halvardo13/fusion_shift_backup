cool_down = max(cool_down - 1,0);
if (cool_down <= 0) {
	image_speed = 1;
	if (animation_clamp == true) {
		if (active_timer != active_timer_set) image_index = clamp(image_index,7,image_number);
		
		active_timer = max(active_timer - 1,0);
		if (active_timer <= 0) {
						
			cool_down = cool_down_set;
			animation_clamp = false;
			active_timer = active_timer_set;
			image_index = 0;
			image_index = 0;
		}
		
	}
	
}
else {
	if (image_index == 0) {
		image_speed = 0;
		image_index = 0;
	}
}


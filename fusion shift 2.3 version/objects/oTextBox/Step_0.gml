//Progress text
letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fMain);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy when done
if (letters >= length) and (keyboard_check_pressed(vk_anykey)) {
	with (oCamera) follow = oPlayer;
	
	
	instance_destroy();
}




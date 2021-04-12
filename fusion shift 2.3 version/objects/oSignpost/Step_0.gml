//Read text
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,read_range)) {
	if (create == true) and (!instance_exists(oTextBox)) {	
		with (instance_create_layer(x,y,"RunGame",oTextBox)) {
			text = other.myText;
			length = string_length(text);	
			
			xDraw = GUI_W/2;
			yDraw = GUI_H/2;
		}
	}
	create = false;
}
else if (point_distance(x,y,oPlayer.x,oPlayer.y) > 32) create = true;
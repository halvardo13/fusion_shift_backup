/// @desc Set Size and Position
camera_set_view_size(view,view_width,view_heigth);


//Move Position
var spd = 2;
if (oGamePlay.fail_state == false) {
	//Normal Follow
	if (instance_exists(follow)) {
		xPos = follow.x-view_width/2;
		yPos = follow.y-view_heigth/2;
	}
}
else {
	xPos = oGamePlay.playerXFailState-view_width/2;	
	yPos = follow.y-view_heigth/2;
}

//Set Positon
var xx = xPos;
var yy = yPos;


//Get curret coords
var cam_current_x = camera_get_view_x(view);
var cam_current_y = camera_get_view_y(view);
var spd = 0.9;

//Clamp camera inside room
xx = clamp(xx,camera_buff,(room_width-camera_buff)-view_width);
yy = clamp(yy,camera_buff,(room_height-camera_buff)-view_heigth);

//Camera Stretch
if (room != rMenu) {
	var xx = lerp(xx,oCourser.x,0.05);
	var yy = lerp(yy,oCourser.y,0.05);
}
else {
	var xx = lerp(xx,oCourser.x,0);
	var yy = lerp(yy,oCourser.y,0);
}

//Screen Shake
xx += random_range(screen_shake_remain,-screen_shake_remain);
yy += random_range(screen_shake_remain,-screen_shake_remain);
screen_shake_remain = max(0,screen_shake_remain-((1/screen_shake_legth)*screen_shake_strength));

//Set new camera position
camera_set_view_pos(view,xx,yy);

lerp(cam_current_x,xx,spd);
lerp(cam_current_y,yy,spd);






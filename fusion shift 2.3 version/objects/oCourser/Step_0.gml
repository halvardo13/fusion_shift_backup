//Follow Mouse
if (global.controller_use == 0) {
	x = mouse_x;
	y = mouse_y;
}
else {
	x = oPlayer.x + lengthdir_x(24+marg, global.controllerAngle);
	y = oPlayer.y + lengthdir_y(24+marg, global.controllerAngle);
}
scaleUp = max(scaleUp - 0.1,1);

//Aim assist
if (global.has_aim_assist == true) {
	if (instance_exists(pEnemy)) {
		var id_near = (instance_nearest(x,y,pEnemy))
		
		if (point_in_circle(id_near.x,id_near.y,mouse_x,mouse_y,aim_assist_radius)) {
			if (id_near.controled == false) {
				x = lerp(mouse_x,id_near.x,aim_assist_setting);
				y = lerp(mouse_y,id_near.y,aim_assist_setting);		
				aim_assist_target = true;
			}
			else aim_assist_target = false;
		}
		else aim_assist_target = false;

	}

}

//Courser Sprite
image_index = aim_assist_target;



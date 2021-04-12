if (global.game_pause == true) {
	image_speed = 0;
	
	exit;	
}
else image_speed = 0;
image_speed = 1*global.time;

switch(dir) {
	//Left
	case "l":
		var _id = instance_place(x,y-1,pEnemy);
		with (_id) hsp_move = Approach(hsp_move,other.spd_set*-1,0.15);	
	break;
	//Rigth
	case "r":
		var _id = instance_place(x,y-1,pEnemy);
		with (_id) hsp_move = Approach(hsp_move,other.spd_set*1,0.15);	
	break;
	//Up
	case "u":
		var timeDecr = 0.35;
		var _id = instance_place(x-1,y,pEnemy);
		with (_id) {
			vsp_move = Approach(vsp_move,(other.spd_set)*other.image_yscale,0.15); 
			force_jump = true;
		}
	break;
	//Down
	case "d":
		var timeDecr = 0.35;
		var _id = instance_place(x+1,y+1,pEnemy);
		with (_id) {
			var spd = other.spd_set * 0.05;
			vsp_move = Approach(vsp_move,(spd)*other.image_yscale,0.15);
			force_jump = true;
		}
	break;
}


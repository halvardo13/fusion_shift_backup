/// @desc Follow Owner
if (instance_exists(oTribeBoss)) and (global.game_pause == false) {
	x = oTribeBoss.x;
	y = oTribeBoss.y;

}

var dir_to_player = point_direction(x,y,oPlayer.x,oPlayer.y);
image_angle = dir_to_player;


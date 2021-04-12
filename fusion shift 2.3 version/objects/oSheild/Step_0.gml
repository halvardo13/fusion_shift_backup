//Game pause / time stop
if (global.game_pause == true) or (global.timeStop == true) {
	image_speed = 0;
	exit;	
}
image_speed = 1;

//Update position
if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
}

//Collision list
var hitlist = ds_list_create();
HitCount = instance_place_list(x,y,pEnemy,hitlist,true);
var closest = true;
repeat(HitCount) {
	with (ds_list_find_value(hitlist,0)) {
		if (controled == false) {
			sheild = true;
		}
	}
	ds_list_delete(hitlist,0)
	var closest = false;
}
ds_list_destroy(hitlist);

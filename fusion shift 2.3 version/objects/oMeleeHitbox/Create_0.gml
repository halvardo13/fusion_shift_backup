var hitlist = ds_list_create();
HitCount = instance_place_list(x,y,pEnemy,hitlist,true);
var closest = true;
repeat(HitCount) {
	with (ds_list_find_value(hitlist,0)) {
		if (controled == false) {
			hp -= 100;

			flash = 1.2;	
		}
	}
	ds_list_delete(hitlist,0)
	var closest = false;
}
ds_list_destroy(hitlist);
instance_destroy();
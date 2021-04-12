//with (oGamePlay) hold_level_complete = true;
if (hp <= 0) and (oGamePlay.fail_state == false) {
	//Destroy enemies
	var inst = instance_number(pEnemy);
	for (var i = 0;i <= inst;i++) {
		instance_destroy(pEnemy);	
	}

}

with (oSpear) instance_destroy();
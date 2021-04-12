global.enemyCount -= 1;

var inst = instance_number(pEnemy);

//with (oGamePlay) hold_level_complete = true;
if (hp <= 0) and (oGamePlay.fail_state == false) {
	for (var i = 0;i <= inst;i++) {
		instance_destroy(pEnemy);	
	}
}
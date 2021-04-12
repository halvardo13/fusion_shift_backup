//Boss 1
if (room == rmLvl_1_9) {
	var hphp = 0;
	if (instance_exists(oPirateBoss)) hphp = oPirateBoss;
	if (!instance_exists(oPirateBoss)) and (hphp <= 0) {
		var inst = instance_number(pEnemy);
		for (var i = 0;i <= inst;i++) {
			instance_destroy(pEnemy);	
		}
	}
}
//Boss 2
if (room == rmLvl_2_9) {
	var hphp = 0;
	if (instance_exists(oTribeBoss)) hphp = oTribeBoss;
	if (!instance_exists(oTribeBoss)) and (hphp <= 0) {
		var inst = instance_number(pEnemy);
		for (var i = 0;i <= inst;i++) {
			instance_destroy(pEnemy);	
		}
	}
}
//Boss 3
if (room == rmLvl_3_9) {
	var hphp = 0;
	if (instance_exists(oSpiderBoss)) hphp = oSpiderBoss;
	if (!instance_exists(oSpiderBoss)) and (hphp <= 0) {
		var inst = instance_number(pEnemy);
		for (var i = 0;i <= inst;i++) {
			instance_destroy(pEnemy);	
		}
	}
}
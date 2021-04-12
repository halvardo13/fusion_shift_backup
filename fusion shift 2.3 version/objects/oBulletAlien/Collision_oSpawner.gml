var destroy = false;
with (other) {
	hp -= other.damage;
	
	flash = 1.2;	
	var destroy = true;
}
if (destroy == true) instance_destroy();
   
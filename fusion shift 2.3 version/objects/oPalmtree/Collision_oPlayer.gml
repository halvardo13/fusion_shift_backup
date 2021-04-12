if (can_shake == true) {
	shake = 2;
	can_shake = false;	
	
	if Chance(0.1) instance_create_layer(x+choose(5,-5),y-sprite_height,"Collision",oCoconut);
}
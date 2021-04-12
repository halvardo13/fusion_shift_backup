
vsp = vsp + grv;

//Vertical Collision
if (place_meeting(x,y+(vsp),pCollision)) {
	while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

alpha = max(alpha - 0.05,0);
if (alpha == 0) instance_destroy();
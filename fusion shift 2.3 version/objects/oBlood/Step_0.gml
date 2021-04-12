





/*
vsp = vsp + grv;
hsp = Approach(hsp,0,0.1)

//Horizontal Collision
if (place_meeting(x+hsp,y,pCollision)) {
	while (!place_meeting(x+sign(hsp),y,pCollision)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;


//Vertical Collision
if (place_meeting(x,y+(vsp),pCollision)) {
	while (!place_meeting(x,y+(sign(vsp)),pCollision)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;




timer -= 1;
if (timer <= 0) instance_destroy();
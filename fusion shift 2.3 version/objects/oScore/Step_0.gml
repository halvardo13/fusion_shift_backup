if (global.timeStop == false) {
	vsp = vsp + grv;
	hsp = Approach(hsp,0,0.05);
}
else {
	hsp = 0;
	vsp = 0;
}


//Horizontal Collision
if (place_meeting(x+(hsp),y,pCollision)) {
	while (!place_meeting(x+(sign(hsp)),y,pCollision)) {
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
	if (place_meeting(x,y-1,pCollision)) {
		vsp = jHeight;
		jHeight *= 0.95;
	}
	else vsp = 0;
}
y += vsp;

//Destroy
if (global.timeStop == false) destroy_timer = max(destroy_timer - 1,0);
if (destroy_timer == clamp(destroy_timer,55,50)) flash = 1.2;
if (destroy_timer <= 0) instance_destroy();


//Update Pos
if (instance_exists(ownerID)) {
	var xx = ownerID.x + xPos;
	var yy = (ownerID.y-12) + yPos;
	
	x = xx;
	y = yy;
} 
else {
	instance_destroy();	
	
	
	var yy = 0;
	var xx = 0;
}


//Wave
var yMove = 5;
y = Wave(yy-yMove,yy+yMove,1.5,0);















function Sinkhole() {
	if (instance_exists(oSinkHole)) {
		if (place_meeting(x,y,oSinkHole)) {
			in_sinkhole = true;	
		}
		else in_sinkhole = false;
	}
	else in_sinkhole = false;

	/*
	add after setting the hsp!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	if (in_sinkhole == true) hsp = hsp * 0.25; 


/* end Sinkhole */
}

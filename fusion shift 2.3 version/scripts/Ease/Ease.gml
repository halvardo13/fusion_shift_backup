/// @description Ease(type,timer,start_pos,end_pos,duration);
/// @param type
/// @param curr_time
/// @param start_pos
/// @param end_pos
/// @param end_time
function Ease() {

	var type			= argument[0];
	var curr_time		= argument[1];
	var start_pos		= argument[2];
	var end_pos			= argument[3];
	var end_time		= argument[4];
	var output			= undefined;
	var reversed		= false;
	var range_shift		= 0;

	// if start position is higher than end position,
	// reverse them and remember that we did so.
	//
	// for example:
	//		start_pos = 30
	//		end_pos = 5
	// becomes:
	//		start_pos = 5
	//		end_pos = 30
	//		reversed = true
	//
	if end_pos < start_pos {
		var end_og		= end_pos;
		var start_og	= start_pos;
		start_pos		= end_og;
		end_pos			= start_og;
		reversed		= true;
	}

	// if range doesn't begin at zero, slide it over to do so.
	// save this shift in range_shift.
	//
	// for example:
	//		start_pos = 10
	//		end_pos = 25
	// becomes:
	//		start_pos = 0
	//		end_pos = 15
	//		range_shift = -10
	//
	if start_pos != 0 {
		range_shift		= start_pos;
		end_pos			-= start_pos;
		start_pos		= 0;
	}

	// if, for some reason, you've coded things in such a way
	// that the current time has exceed the end time, fear not.
	//
	if curr_time > end_time {
		curr_time = end_time;
	}

	switch type {
	
		case "linear":
			output = end_pos * curr_time / end_time + start_pos;
			break
		
		case "in-quad":
			curr_time /= end_time;
			output = end_pos * curr_time * curr_time + start_pos;
			break
		
		case "out-quad":
			curr_time /= end_time;
			output = -end_pos * curr_time * (curr_time - 2) + start_pos;
			break
		
		case "in-out-quad":
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * curr_time * curr_time + start_pos;
			}
			else {
				output = end_pos * -0.5 * (--curr_time * (curr_time - 2) - 1) + start_pos;
			}
			break
		
		case "in-cubic":
			output = end_pos * power(curr_time/end_time, 3) + start_pos;
			break
		
		case "out-cubic":
			output = end_pos * (power(curr_time/end_time - 1, 3) + 1) + start_pos;
			break
		
		case "in-out-cubic":
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 3) + start_pos;
			}
			else {
				output = end_pos * 0.5 * (power(curr_time - 2, 3) + 2) + start_pos;
			}
			break
		
		case "in-quart":
			output = end_pos * power(curr_time / end_time, 4) + start_pos;
			break
		
		case "out-quart":
			output = -end_pos * (power(curr_time / end_time - 1, 4) - 1) + start_pos;
			break
		
		case "in-out-quart":
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 4) + start_pos;
			}
			else {
				output = end_pos * -0.5 * (power(curr_time - 2, 4) - 2) + start_pos;
			}
			break
		
		case "in-quint":
			output = end_pos * power(curr_time / end_time, 5) + start_pos;
			break
		
		case "out-quint":
			output = end_pos * (power(curr_time / end_time - 1, 5) + 1) + start_pos;
			break
		
		case "in-out-quint":
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 5) + start_pos;
			}
			else {
				output = end_pos * 0.5 * (power(curr_time - 2, 5) + 2) + start_pos;
			}
			break
		
		case "in-sine":
			output = end_pos * (1 - cos(curr_time / end_time * (pi / 2))) + start_pos;
			break
		
		case "out-sine":
			output = end_pos * sin(curr_time / end_time * (pi / 2)) + start_pos;
			break
		
		case "in-out-sine":
			output = end_pos * 0.5 * (1 - cos(pi * curr_time / end_time)) + start_pos;
			break
	
		case "in-circ":
			curr_time /= end_time;
			output = end_pos * (1 - sqrt(1 - curr_time * curr_time)) + start_pos;
			break
	
		case "out-circ":
			curr_time = curr_time / end_time - 1;
			output = end_pos * sqrt(1 - curr_time * curr_time) + start_pos;
			break
	
		case "in-out-circ":
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * (1 - sqrt(1 - curr_time * curr_time)) + start_pos;
			}
			else {	
				curr_time -= 2;
				output = end_pos * 0.5 * (sqrt(1 - curr_time * curr_time) + 1) + start_pos;
			}
			break
	
		case "in-expo":
			output = end_pos * power(2, 10 * (curr_time / end_time - 1)) + start_pos;
			break;
	
		case "out-expo":
			output = end_pos * (-power(2, -10 * curr_time / end_time) + 1) + start_pos;
			break;
	
		case "in-out-expo":
			curr_time /= end_time * 0.5
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(2, 10 * --curr_time) + start_pos;
			}
			else {
				output = end_pos * 0.5 * (-power(2, -10 * --curr_time) + 2) + start_pos;
			}
			break;
	
		case "in-elastic":
			var _s = 1.70158;
			var _p = 0;
			var _a = end_pos;
			if (curr_time == 0 || _a == 0) {
				output = start_pos;
			}
			curr_time /= end_time;
			if (curr_time == 1) {
				output = start_pos+end_pos;
			}
			if (_p == 0) {
				_p = end_time*0.3;
			}	
			if (_a < abs(end_pos)) { 
				_a = end_pos;
				_s = _p*0.25;
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a);
			}
			output = -(_a * power(2,10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p)) + start_pos;
			break;
		
		case "out-elastic":
			var _s = 1.70158;
			var _p = 0;
			var _a = end_pos;
			if (curr_time == 0 || _a == 0) {
				output = start_pos;
			}
			curr_time /= end_time
			if (curr_time == 1) {
				output = start_pos + end_pos;
			}
			if (_p == 0) {
				_p = end_time * 0.3;
			}
			if (_a < abs(end_pos)) { 
				_a = end_pos;
				_s = _p * 0.25;
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a);
			}
			output = _a * power(2, -10 * curr_time) * sin((curr_time * end_time - _s) * (2 * pi) / _p ) + end_pos + start_pos
			break;
	
		case "in-out-elastic":
			var _s = 1.70158;
			var _p = 0;
			var _a = end_pos;
			if (curr_time == 0 || _a == 0) {
				output = start_pos;
			}
			curr_time /= end_time*0.5;
			if (curr_time == 2) {
				output = start_pos+end_pos;
			}
		
			if (_p == 0) {
				_p = end_time * (0.3 * 1.5);
			}
		
			if (_a < abs(end_pos)) { 
				_a = end_pos; 
				_s = _p * 0.25;
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a);
			}
		
			if (curr_time < 1) {
				output = -0.5 * (_a * power(2, 10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p)) + start_pos;
			}
			output = _a * power(2, -10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p) * 0.5 + end_pos + start_pos;
			break;
		
		case "in-back":
			var _s = 1.70158;
			curr_time /= end_time;
			output = end_pos * curr_time * curr_time * ((_s + 1) * curr_time - _s) + start_pos;
			break
		
		case "out-back":
			var _s = 1.70158;
			curr_time = curr_time/end_time - 1;
			output = end_pos * (curr_time * curr_time * ((_s + 1) * curr_time + _s) + 1) + start_pos;
			break
	
		case "in-out-back":
			var _s = 1.70158;
			curr_time = curr_time/end_time*2;
			if (curr_time < 1) {
				_s *= 1.525;
				output = end_pos * 0.5 * (curr_time * curr_time * ((_s + 1) * curr_time - _s)) + start_pos;
			}
			else {
				curr_time -= 2;
				_s *= 1.525;
				output = end_pos * 0.5 * (curr_time * curr_time * ((_s + 1) * curr_time + _s) + 2) + start_pos;
			}
			break;
	
		case "in-bounce":
			output = end_pos - Ease("out-bounce", end_time - curr_time, 0, end_pos, end_time) + start_pos;
			break;
	
		case "out-bounce":
			curr_time /= end_time;
			if (curr_time < 1/2.75) {
				output = end_pos * 7.5625 * curr_time * curr_time + start_pos;
			}
			else if (curr_time < 2/2.75)	{
				curr_time -= 1.5/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.75) + start_pos;
			}
			else if (curr_time < 2.5/2.75) {
				curr_time -= 2.25/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.9375) + start_pos;
			}
			else {
				curr_time -= 2.625/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.984375) + start_pos;
			}
			break;
	
		case "in-out-bounce":
			if (curr_time < end_time*0.5) {
				output = (Ease("in-bounce", curr_time*2, 0, end_pos, end_time)*0.5 + start_pos);
			}
			else {
				output = (Ease("out-bounce", curr_time*2 - end_time, 0, end_pos, end_time)*0.5 + end_pos*0.5 + start_pos);
			}
			break
	}

	// un-reverse
	if reversed {
		var range_output_to_end = end_pos - output;
		output = end_og + range_output_to_end - range_shift;
	}

	// un-shift
	output += range_shift;

	// ezpz
	return output;


}

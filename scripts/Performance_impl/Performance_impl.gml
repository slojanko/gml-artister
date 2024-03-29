enum PerformanceFormat {
	s = 1000000, 
	ms = 1000, 
	ns = 1
}

function Performance() constructor{
	time_taken = 0;
	start_time = 0;
	end_time = 0;
	is_ticking = false;
	longest_time_taken = 0;
	
	static Start = function() {
		if (!is_ticking) {
			start_time = get_timer();
			is_ticking = true;
		}
	}
	
	static End = function() {
		if (is_ticking) {
			end_time = get_timer();
			time_taken = end_time - start_time;
			if (time_taken > longest_time_taken) {
				longest_time_taken = time_taken;
			}	
			is_ticking = false;
		}
	}
		
	static Reset = function() {	
		time_taken = 0;
		start_time = 0;
		end_time = 0;
		is_ticking = false;
		longest_time_taken = 0;
	}
	
	static GetTime = function(performance_format_) {
		return time_taken / performance_format_;
	}
	
	static GetLongestTime = function(performance_format_) {
		return longest_time_taken / performance_format_;
	}
}
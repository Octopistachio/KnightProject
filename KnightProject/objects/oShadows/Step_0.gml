
if(global.time>oTime.totalDaylightCycle)
     shadowDirection = 0;
else if (global.time==oTime.dayLength+1)
	shadowDirection = 270;
else
	shadowDirection += 360/oTime.totalDaylightCycle
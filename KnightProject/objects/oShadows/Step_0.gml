
if(global.time == 0 || global.time == oTime.totalDaylightCycle)
     shadowDirection = 0;
else if (global.time==oTime.dayLength)
	shadowDirection = 270;

shadowDirection += 360/(oTime.totalDaylightCycle);


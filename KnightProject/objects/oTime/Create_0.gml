//Day is 5 minutes
//Night is 2.5 minutes

dayMinutes = .1;
nightMinutes = dayMinutes/2;

dayLength = (dayMinutes*60)*room_speed;
nightLength = (nightMinutes*60)*room_speed;
totalDaylightCycle = dayLength + nightLength;

isDay = true;

global.time = 0;

margin = 16;

nightOverlayAlpha = 0;
maxNightOverlayAlpha = 0.2;

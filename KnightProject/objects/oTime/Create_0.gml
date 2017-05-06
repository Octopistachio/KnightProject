//Day is 5 minutes
//Night is 2 minutes

dayMinutes = 5;
nightMinutes = dayMinutes/2;

global.day = (dayMinutes*60)*room_speed;
global.night = (nightMinutes*60)*room_speed;

global.isDay = true;

global.time = 0;

margin = 16;


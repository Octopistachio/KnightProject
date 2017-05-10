global.time++;

if(global.time<=dayLength){
    isDay = true;
}
else{
    isDay = false;
    nightOverlayAlpha += maxNightOverlayAlpha/nightLength;

}

if(global.time>totalDaylightCycle)
{
    global.time = -1;
	nightOverlayAlpha = 0;
}

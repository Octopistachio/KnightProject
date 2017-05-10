global.time++;

if(global.time<=dayLength){
    isDay = true;
}
else{
    isDay = false;
	if(global.time<=totalDaylightCycle-nightLength/2)
		nightOverlayAlpha += maxNightOverlayAlpha/nightLength*2;
	else
		nightOverlayAlpha -= maxNightOverlayAlpha/nightLength*2;

}

if(global.time>totalDaylightCycle)
{
    global.time = -1;
	nightOverlayAlpha = 0;
}

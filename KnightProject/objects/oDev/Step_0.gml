if(keyboard_check_pressed(ord("B")))
{
	global.time = oTime.totalDaylightCycle+1;
}

if(keyboard_check_pressed(ord("N")))
{
	global.time = oTime.dayLength;
}

if(keyboard_check_pressed(ord("O")))
{
	oPlayer.x = 10;
	oPlayer.y = 10;
}

if(keyboard_check_pressed(ord("I")))
{
	oPlayer.x = oCastleWallTopRight.x - (oGame.castleTileSize * oGame.numberOfCastleTiles/2) + oGame.castleTileSize/2
	oPlayer.y = oCastleWallTopRight.y + (oGame.castleTileSize * oGame.numberOfCastleTiles/2)
}
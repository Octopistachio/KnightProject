if(keyboard_check_pressed(consoleEnableKey))
{
	if(!consoleEnabled)
		consoleEnabled = true;
	else
	{
		consoleEnabled = false;
		
	}
}
	
if(consoleEnabled)
{
	if(keyboard_check_pressed(ord("B")))
	{
		global.time = oTime.totalDaylightCycle;
	}

	if(keyboard_check_pressed(ord("N")))
	{
		global.time = oTime.dayLength;
	}

	if(keyboard_check_pressed(ord("O")))
	{
		oPlayer.x = 100;
		oPlayer.y = 100;
	}

	if(keyboard_check_pressed(ord("I")))
	{
		oPlayer.x = oCastleWallTopRight.x - (oGame.castleTileSize * oGame.numberOfCastleTiles/2) + oGame.castleTileSize/2
		oPlayer.y = oCastleWallTopRight.y + (oGame.castleTileSize * oGame.numberOfCastleTiles/2)
	}

	if(keyboard_check_pressed(ord("R")))
	{
		room_restart();
	}
}

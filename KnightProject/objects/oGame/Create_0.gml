ScreenBullshit();
audio_play_sound(aBackgroundMusic,1,true);

window_set_cursor(cr_none);

//instance_create(0,0,oCursor); //Spawn the cursor

/* Layers */
layer_create(-999, "GUI");
layer_create(999, "Background");
layer_create(0, "Foreground");

/* Castle Spawn */

topRightWallRandom_x = round(random_range(10000,40000));
topRightWallRandom_y = round(random_range(10000,40000));

instance_create(topRightWallRandom_x,topRightWallRandom_x,oCastleWallTopRight); //Spawn top right corner

castleTileSize = sprite_get_width(oCastleWallTopRight); //Size of the castle's tiles
numberOfCastleTiles = 16; //Number of tiles wide the castle should be
bottomLeftWall_x = oCastleWallTopRight.x - castleTileSize * (numberOfCastleTiles - 1); //X coord of the bottom left corner
bottomLeftWall_y = oCastleWallTopRight.x + castleTileSize * (numberOfCastleTiles - 1); //Y coord of the bottom left corner

instance_create(bottomLeftWall_x,bottomLeftWall_y,oCastleWallBottomLeft);//Spawn bottom left corner

for(i = 0; i < numberOfCastleTiles; i++) //Top Left to Top Right
{
	if( i < 7 || i > 9)
		instance_create(oCastleWallTopRight.x - castleTileSize * i, oCastleWallTopRight.y, oCastleWall);
}	
	
for(i = 0; i < numberOfCastleTiles; i++) //Bottom Left to Bottom Right
	instance_create(oCastleWallTopRight.x - castleTileSize * i, oCastleWallBottomLeft.y, oCastleWall);

for(i = 0; i < numberOfCastleTiles; i++) //Top Right to Bottom Right
	instance_create(oCastleWallTopRight.x, oCastleWallTopRight.y + castleTileSize * i, oCastleWall);
	
for(i = 0; i < numberOfCastleTiles; i++) //Top Left to Bottom Left
	instance_create(oCastleWallBottomLeft.x, oCastleWallTopRight.y + castleTileSize * i, oCastleWall);
	
instance_create(oCastleWallTopRight.x - (castleTileSize * numberOfCastleTiles/2) + castleTileSize/2, oCastleWallTopRight.y + (castleTileSize * numberOfCastleTiles/2) - castleTileSize/2, oPlayer);
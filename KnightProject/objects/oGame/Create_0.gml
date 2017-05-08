ScreenBullshit();
audio_play_sound(aBackgroundMusic,1,true);
window_set_cursor(cr_none);

/* Variables */

cursorExtendAnimation = 0;
cursorExtendAnimationTimer = 0.1;

topRightWallRandom_x = round(random_range(10000,40000));
topRightWallRandom_y = round(random_range(10000,40000));

castleTileSize = sprite_get_width(oCastleWallTopRight); //Size of the castle's tiles
numberOfCastleTiles = 16; //Number of tiles wide the castle should be

numberOfTrees = random_range(1000, 2000);



/* Layers */
layer_create(-999, "GUI");
layer_create(999, "Background");
layer_create(0, "Foreground");

/* Castle Spawn */


instance_create(topRightWallRandom_x,topRightWallRandom_x,oCastleWallTopRight); //Spawn top right corner

bottomLeftWall_x = oCastleWallTopRight.x - castleTileSize * (numberOfCastleTiles - 1); //X coord of the bottom left corner
bottomLeftWall_y = oCastleWallTopRight.x + castleTileSize * (numberOfCastleTiles - 1); //Y coord of the bottom left corner

instance_create(bottomLeftWall_x,bottomLeftWall_y,oCastleWallBottomLeft);//Spawn bottom left corner

for(var i = 0; i < numberOfCastleTiles; i++) //Top Left to Top Right
{
	if( i < 7 || i > 9)
		instance_create(oCastleWallTopRight.x - castleTileSize * i, oCastleWallTopRight.y, oCastleWall);
}	
	
for(var i = 0; i < numberOfCastleTiles; i++) //Bottom Left to Bottom Right
	instance_create(oCastleWallTopRight.x - castleTileSize * i, oCastleWallBottomLeft.y, oCastleWall);

for(var i = 0; i < numberOfCastleTiles; i++) //Top Right to Bottom Right
	instance_create(oCastleWallTopRight.x, oCastleWallTopRight.y + castleTileSize * i, oCastleWall);
	
for(var i = 0; i < numberOfCastleTiles; i++) //Top Left to Bottom Left
	instance_create(oCastleWallBottomLeft.x, oCastleWallTopRight.y + castleTileSize * i, oCastleWall);
	
//Spawn player in the center of the castle
instance_create(oCastleWallTopRight.x - (castleTileSize * numberOfCastleTiles/2) + castleTileSize/2, oCastleWallTopRight.y + (castleTileSize * numberOfCastleTiles/2) - castleTileSize/2, oPlayer);

/* Tree Spawn */
for(var i=0; i<numberOfTrees; i++)
{

	var rand_x = random_range(0,room_width);
	var rand_y = random_range(0,room_height);
	instance_create(rand_x, rand_y, oTreeTop);
	instance_create(rand_x, rand_y, oTreeTrunk);
}
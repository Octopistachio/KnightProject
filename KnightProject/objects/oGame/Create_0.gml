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

guiAlpha = .8;

cellSize = 32;

/* Layers */
layer_create(-999, "Above");
layer_create(999, "Background");
layer_create(0, "Foreground");

/* Views */
//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to 640x480
view_set_wport(0, display_get_width());
view_set_hport(0, display_get_height());

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);

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

//Spawn king in the center of the castle
instance_create(oCastleWallTopRight.x - (castleTileSize * numberOfCastleTiles/2) + castleTileSize/2, oCastleWallTopRight.y + (castleTileSize * numberOfCastleTiles/2) - castleTileSize/2, oKing);

/* Tree Spawn */
//for(var i=0; i<numberOfTrees; i++)
//{

//	var rand_x = random_range(0,room_width);
//	var rand_y = random_range(0,room_height);
	
	
//	if(place_empty(rand_x, rand_y))
//	{
//		instance_create(rand_x, rand_y, oTreeTop);
//		instance_create(rand_x, rand_y, oTreeTrunk);
//	}
		
//}

for(var i=0; i<numberOfTrees; i++)
{
	var rand_x = random_range(0,room_width);
	var rand_y = random_range(0,room_height);

	if place_free(rand_x, rand_y)
	   {
	      instance_create(rand_x, rand_y, oTreeTop);
		  instance_create(rand_x, rand_y, oTreeTrunk);
	   }
	else if !place_free(rand_x, rand_y)
	   {
	     do
	       {
	          rand_x = random_range(0,room_width);
	          rand_y = random_range(0,room_height);
	       }
	     until (place_free(rand_x, rand_y));

			instance_create(rand_x, rand_y, oTreeTop);
			instance_create(rand_x, rand_y, oTreeTrunk);
		}
	   
}

/* Pathing */
global.AI_grid = mp_grid_create(0,0, room_width/cellSize, room_height/cellSize, cellSize, cellSize);

mp_grid_add_instances(global.AI_grid, oCastleWall, false);
mp_grid_add_instances(global.AI_grid, oTreeTrunk, false);
/* Variables */
topRightWallRandom_x = round(random_range(10000,40000));
topRightWallRandom_y = round(random_range(10000,40000));

castleTileSize = sprite_get_width(oCastleWallTopRight); //Size of the castle's tiles
numberOfCastleTiles = 16; //Number of tiles wide the castle should be

minNumberOfTrees = 1;
maxNumberOfTrees = 2;

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


/* Creation Grid */
creationCellSize = 1024; //The size of one creation cell

creationCellAllWidth = room_width/creationCellSize; //The number of creation cells wide the room is
creationCellAllHeight = room_width/creationCellSize; //The number of creation cells high the room is

//The coordinates of the corners of the creation cell
creationCellTopRight_x = [];
creationCellTopRight_y = [];
creationCellBottomLeft_x = [];
creationCellBottomLeft_y = [];

for(var i = 0; i < creationCellAllWidth; i++)
{
	for(var j = 0; j < creationCellAllHeight; j++)
		{
					
			creationCellTopRight_x[i,j] = creationCellSize * (j+1);
			creationCellTopRight_y[i,j] = creationCellSize * (i+1);
			
			creationCellBottomLeft_x[i,j] = creationCellSize * j;
			creationCellBottomLeft_y[i,j] = creationCellSize * i;
			
			show_debug_message("Creation Cell Row " + string(i+1) + ", Column " + string(j+1) + ": (" + 
			string(creationCellTopRight_x[i,j]) + ", " + string(creationCellTopRight_y[i,j]) + ") , (" + 
			string(creationCellBottomLeft_x[i,j]) + ", " + string(creationCellBottomLeft_y[i,j]) + ")");
			
		}
}


/* Spawn Terrain */
for(var i = 0; i < creationCellAllWidth; i++)
{
	for(var j = 0; j < creationCellAllHeight; j++)
	{
		/* Tree Spawn */
			
		var treesToCreate = round(random_range(minNumberOfTrees, maxNumberOfTrees));
		for(var k = 0; k<treesToCreate; k++)
		{
			var rand_x = random_range(creationCellBottomLeft_x[i,j],creationCellTopRight_x[i,j]);
			var rand_y = random_range(creationCellBottomLeft_y[i,j],creationCellTopRight_y[i,j]);
			
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
		
		/*  */
			
	}
		
}

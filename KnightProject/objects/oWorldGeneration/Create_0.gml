/* Variables */
topRightWallRandom_x = round(random_range(10000,40000));
topRightWallRandom_y = round(random_range(10000,40000));

castleTileSize = sprite_get_width(oCastleWallTopRight); //Size of the castle's tiles
numberOfCastleTiles = 16; //Number of tiles wide the castle should be

minNumberOfTrees = 1;
maxNumberOfTrees = 2;

/* Castle Spawn */
instance_create_depth(topRightWallRandom_x,topRightWallRandom_x,0,oCastleWallTopRight); //Spawn top right corner

bottomLeftWall_x = oCastleWallTopRight.x - castleTileSize * (numberOfCastleTiles - 1); //X coord of the bottom left corner
bottomLeftWall_y = oCastleWallTopRight.x + castleTileSize * (numberOfCastleTiles - 1); //Y coord of the bottom left corner

instance_create_depth(bottomLeftWall_x,bottomLeftWall_y,0,oCastleWallBottomLeft);//Spawn bottom left corner

for(var i = 0; i < numberOfCastleTiles; i++) //Top Left to Top Right
{
	if( i < 7 || i > 9)
		instance_create_depth(oCastleWallTopRight.x - castleTileSize * i, oCastleWallTopRight.y, 0, oCastleWall);
}	
	
for(var i = 0; i < numberOfCastleTiles; i++) //Bottom Left to Bottom Right
	instance_create_depth(oCastleWallTopRight.x - castleTileSize * i, oCastleWallBottomLeft.y, 0, oCastleWall);

for(var i = 0; i < numberOfCastleTiles; i++) //Top Right to Bottom Right
	instance_create_depth(oCastleWallTopRight.x, oCastleWallTopRight.y + castleTileSize * i, 0, oCastleWall);
	
for(var i = 0; i < numberOfCastleTiles; i++) //Top Left to Bottom Left
	instance_create_depth(oCastleWallBottomLeft.x, oCastleWallTopRight.y + castleTileSize * i, 0, oCastleWall);
	
//Spawn player in the center of the castle
instance_create_depth(oCastleWallTopRight.x - (castleTileSize * numberOfCastleTiles/2) + castleTileSize/2, oCastleWallTopRight.y + (castleTileSize * numberOfCastleTiles/2) - castleTileSize/2, 0, oPlayer);

//Spawn king in the center of the castle
instance_create_depth(oCastleWallTopRight.x - (castleTileSize * numberOfCastleTiles/2) + castleTileSize/2, oCastleWallTopRight.y + (castleTileSize * numberOfCastleTiles/2) - castleTileSize/2, 0, oKing);


/* Creation Grid */
creationCellSize = 1024; //The size of one creation cell

creationCellAllWidth = room_width/creationCellSize; //The number of creation cells wide the room is
creationCellAllHeight = room_width/creationCellSize; //The number of creation cells high the room is

creationDSGrid = ds_grid_create(creationCellAllWidth, creationCellAllHeight);

//The coordinates of the corners of the creation cell
creationCellTopRight_x = [];
creationCellTopRight_y = [];
creationCellBottomLeft_x = [];
creationCellBottomLeft_y = [];

//The player's starting coords

old_oPlayer_cell_column = 0;
old_oPlayer_cell_row = 0;


//The coordinates of the trees
oTreeTrunk_x = [];
oTreeTrunk_y = [];
oTreeTrunk_cell_row = [];
oTreeTrunk_cell_column = [];

for(var i = 0; i < creationCellAllHeight; i++)
{
	for(var j = 0; j < creationCellAllWidth; j++)
		{
					
			creationCellTopRight_x[i,j] = creationCellSize * (j+1);
			creationCellTopRight_y[i,j] = creationCellSize * (i+1);
			
			creationCellBottomLeft_x[i,j] = creationCellSize * j;
			creationCellBottomLeft_y[i,j] = creationCellSize * i;	
				
			
		}
}


/* Pick Terrain Coordinates */
for(var i = 0; i < creationCellAllHeight; i++)
{
	for(var j = 0; j < creationCellAllWidth; j++)
	{
		/* Tree Spawn */
			
		var treesToCreate = round(random_range(minNumberOfTrees, maxNumberOfTrees));
		for(var k = 0; k<treesToCreate; k++)
		{
			var rand_x = random_range(creationCellBottomLeft_x[i,j],creationCellTopRight_x[i,j]);
			var rand_y = random_range(creationCellBottomLeft_y[i,j],creationCellTopRight_y[i,j]);
			
			oTreeTrunk_x[i,j] = rand_x;
			oTreeTrunk_y[i,j] = rand_y;
			
			oTreeTrunk_cell_column[i,j] = i;
			oTreeTrunk_cell_row[i,j] = j;
		}
		
		/*  */
			
	}
		
}

for(var i = 0; i < creationCellAllHeight; i++)
{
	for(var j = 0; j < creationCellAllWidth; j++)
		{
			if(oPlayer.x <= creationCellTopRight_x[i,j] && oPlayer.x >= creationCellBottomLeft_x[i,j] &&
			   oPlayer.y <= creationCellTopRight_y[i,j] && oPlayer.y >= creationCellBottomLeft_y[i,j])
			{
				oPlayer_cell_column = i;
				oPlayer_cell_row = j;
			}
		}
}

old_oPlayer_cell_column = oPlayer_cell_column;
old_oPlayer_cell_row = oPlayer_cell_row;
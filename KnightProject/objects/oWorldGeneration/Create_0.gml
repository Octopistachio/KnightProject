/* Variables */
castleTileSize = sprite_get_width(oCastleWallTopRight); //Size of the castle's tiles
numberOfCastleTiles = 16; //Number of tiles wide the castle should be

topRightWallRandom_x = round(random_range(castleTileSize*numberOfCastleTiles,room_width - castleTileSize*numberOfCastleTiles));
topRightWallRandom_y = round(random_range(castleTileSize*numberOfCastleTiles,room_height - castleTileSize*numberOfCastleTiles));

minNumberOfTrees = 2;
maxNumberOfTrees = 5;

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

creationCellAllWidth = round(room_width/creationCellSize); //The number of creation cells wide the room is
creationCellAllHeight = round(room_width/creationCellSize); //The number of creation cells high the room is

creationDSGrid = ds_grid_create(creationCellAllWidth, creationCellAllHeight);

//The coordinates of the corners of the creation cell
creationCellTopRight_x = [];
creationCellTopRight_y = [];
creationCellBottomLeft_x = [];
creationCellBottomLeft_y = [];

//The player's starting coords

old_oPlayer_cell_column = 0;
old_oPlayer_cell_row = 0;

oPlayer_cell_column = 0;
oPlayer_cell_row = 0;


//The coordinates of the trees
oTreeTrunk_cell_x = []; //Array of oTreeTrunk_x's
oTreeTrunk_cell_y = []; //Array of oTreeTrunk_y's
oTreeTrunk_cell_amount = []; //Amount of trees in the current cell

for(var i = 0; i < creationCellAllHeight; i++) //For every column
	for(var j = 0; j < creationCellAllWidth; j++) //For every row
		{

			creationCellTopRight_x[i,j] = creationCellSize * (j+1); //Make the top right x of the cell to the width * the row + 1
			creationCellTopRight_y[i,j] = creationCellSize * (i+1); //Make the top right y of the cell to the width * the column + 1
			
			creationCellBottomLeft_x[i,j] = creationCellSize * j; //Make the bottom left x of the cell to the width * the row
			creationCellBottomLeft_y[i,j] = creationCellSize * i; //Make the bottom left y of the cell to the width * the column
			
		}

for(var i = 0; i < creationCellAllWidth; i++)
	for(var j = 0; j < creationCellAllHeight; j++)
		{
			if(oPlayer.x <= creationCellTopRight_x[i,j] && oPlayer.x >= creationCellBottomLeft_x[i,j] &&
			   oPlayer.y <= creationCellTopRight_y[i,j] && oPlayer.y >= creationCellBottomLeft_y[i,j])
			{
				oPlayer_cell_column = i;
				oPlayer_cell_row = j;
			}
		}
		
for(var i = 0; i < creationCellAllWidth; i++) //For every column
{
	for(var j = 0; j < creationCellAllHeight; j++) //For every row
	{
		var toCreate = round(random_range(minNumberOfTrees, maxNumberOfTrees)); //Randomize the number of objects to spawn
		oTreeTrunk_cell_amount[i, j] = toCreate;
	}
}

oTreeTrunk_cell_x = CreateTerrain(oTreeTrunk_cell_amount, "x");
oTreeTrunk_cell_y = CreateTerrain(oTreeTrunk_cell_amount, "y");

OutputArray(oTreeTrunk_cell_x, "oTreeTrunk_cell_x", true);


old_oPlayer_cell_column = oPlayer_cell_column;
old_oPlayer_cell_row = oPlayer_cell_row;
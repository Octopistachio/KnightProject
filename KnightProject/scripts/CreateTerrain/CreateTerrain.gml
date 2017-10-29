/// @description CreateTerrain(amount, coord);
/// @function CreateTerrain
/// @param amount
/// @param coord

if(!is_array(argument0))
	show_error("Amount must be an array!", true);

amount = argument0;
coord = argument1;

var maxRow = oWorldGeneration.creationCellAllWidth;
var maxCol = oWorldGeneration.creationCellAllHeight;

var leftBound, rightBound;

var coordArray = [];
var object_coord = [];

if(coord == "x" || coord == "X")
{
	leftBound = oWorldGeneration.creationCellBottomLeft_x;
	rightBound = oWorldGeneration.creationCellTopRight_x;
}
else if(coord == "y" || coord == "Y")
{
	leftBound = oWorldGeneration.creationCellBottomLeft_y;
	rightBound = oWorldGeneration.creationCellTopRight_y;
}
else
{
	show_error("Variable must be X or Y!", true);	
}
	
for(var i = 0; i < maxRow; i++) //For every column
{
	for(var j = 0; j < maxCol; j++) //For every row
	{
		for(var k = 0; k<amount[i,j]; k++) //For each object
		{
				
			object_coord[k] = random_range(leftBound[i,j],rightBound[i,j]); //Pick a random x inside of the it's grid;
			show_debug_message("(i: " + string(i) + ", j: " + string(j) + ", k: " + string(k) + ") has a " + 
			coord + " of " + string(object_coord[k]));
				
		}
		
		coordArray[i, j] = object_coord;

	}
}

return coordArray;
/// @description TerrainSpawn(object_cell_x, object_cell_y, amount, object, object_depth);
/// @function TerrainSpawn
/// @param object_cell_x
/// @param object_cell_y
/// @param amount
/// @param object
/// @param object_depth

object_cell_x = argument0;
object_cell_y = argument1;
amount = argument2;
object = argument3;
object_depth = argument4;

var object_x = [];
var object_y = [];

var instance = noone;

var row = oWorldGeneration.oPlayer_cell_row;
var col = oWorldGeneration.oPlayer_cell_column;

var old_row = oWorldGeneration.old_oPlayer_cell_row;
var old_col = oWorldGeneration.old_oPlayer_cell_column; 

if(row != old_row || col != old_col) //If the player is entering a new cell
{
	//with(object)
	//{
	//	instance_destroy(self.id);
	//	show_debug_message("Instance of " + string(object_get_name(object)) + 
	//	" was destroyed in square (" + string(oPlayer_cell_row) + ", " + string(oPlayer_cell_column) + ") Instance id: " + 
	//	string(instance));
	//}
	
	object_x = ds_grid_get(object_cell_x, row, col); //Set object_x to the array of x's in object_cell_x[i,j]
	object_y = ds_grid_get(object_cell_y, row, col); //Set object_y to the array of y's in object_cell_y[i,j]
	
	
	show_debug_message(string(object_x));
				
	for(var i = 0; i < ds_grid_get(amount, row, col); i++) //For each object in the tile
	{
		instance = instance_create_depth(object_x[i], object_y[i], object_depth, object); //Create an instance
		
		show_debug_message(string(i+1) + " instance of " + string(object_get_name(object)) + 
		" was created in square (" + string(row) + ", " + string(col) + ") Instance id: " + 
		string(instance) + " x: " + string(object_x[i]) + " y: " + string(object_y[i]));
	}
	
	show_debug_message("");
	
}

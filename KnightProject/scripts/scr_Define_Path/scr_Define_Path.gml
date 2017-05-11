/// @description scr_Define_Path(start_x, start_y, finish_x, finish_y, path);
/// @function scr_Define_Path
/// @param start_x
/// @param start_y
/// @param finish_x
/// @param finish_y
/// @param path


var start_x = argument0;
var start_y = argument1;
var finish_x = argument2;
var finish_y = argument3;

var path = argument4;

if !mp_grid_path(global.AI_grid, path, start_x, start_y, finish_x, finish_y, true)
{
	show_message("NO PATH!");
	return false;
}
else
{
	path_set_kind(path, 1);
	path_set_precision(path, 8)
	return true;
}
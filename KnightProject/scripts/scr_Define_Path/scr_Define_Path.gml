/// @description scr_Define_Path(start_object, finish_object);
/// @function scr_Define_Path
/// @param start_object
/// @param finish_object

var startObject = argument0;
var finishObject = argument1;

var sx = startObject.x;
var sy = startObject.y;
var fx = finishObject.x;
var fy = finishObject.y;

if !mp_grid_path(global.AI_grid, global.path, sx, sy, fx, fy, true)
{
	show_message("NO PATH!");
	return false;
}
else
{
	path_set_kind(global.path, 1);
	path_set_precision(global.path, 8)
	return true;
}
/// @description OutputArray(arr, displayName, is2D);
/// @function OutputArray
/// @param arr
/// @param displayNam
/// @param is2D

var arr = argument0;
var displayName = argument1;
var is2D = argument2;


if(is_array(arr)){
	 if(is2D)
		 for(var i = 0; i < array_height_2d(arr); i++) {
			for(var j = 0; j < array_length_2d(arr, i); j++)
				show_debug_message(displayName + "(i: " + i + ", j: " + j + ") = " + arr[i, j]);
		 }
	else
	{
			for(var i = 0; i < array_length_1d(arr); i++)
				show_debug_message(displayName + "(i: " + i + ") = " + arr[i]);
			show_debug_message(arr);
			str = "";
	}
}
else
	show_error("Wrong type!", true);
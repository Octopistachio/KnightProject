/* Grid */
if(consoleEnabled)
{
	if(keyboard_check_pressed(ord("G")))
	{
		if(!gridEnabled)
			gridEnabled = true;
		else
			gridEnabled = false;
	}
	
	if(keyboard_check_pressed(ord("H")))
	{
		if(!pathEnabled)
			pathEnabled = true;
		else
			pathEnabled = false;
	}
	
	if(keyboard_check_pressed(ord("V")))
	{
		if(!creationGridEnabled)
			creationGridEnabled = true;
		else
			creationGridEnabled = false;
	}
		
}

if(gridEnabled)
	{
		draw_set_alpha(.5);
	
		mp_grid_draw(global.AI_grid);
	
		for(var i = 0; i < room_width; i += oGame.cellSize)
			draw_line(i, 0, i, room_height);
		for(var i = 0; i < room_height; i += oGame.cellSize)
			draw_line(0, i, room_width, i);
	}
	
if(pathEnabled)
	draw_path(oEnemy.pathEnemy, x, y, true);
	
if(creationGridEnabled)
{
	for(var i = 0; i<array_height_2d(oWorldGeneration.creationCellTopRight_x); i++)
	{
		for(var j = 0; j<array_length_2d(oWorldGeneration.creationCellTopRight_x, i); j++)
			{
				draw_rectangle(oWorldGeneration.creationCellTopRight_x[i,j], oWorldGeneration.creationCellTopRight_y[i,j],oWorldGeneration.creationCellBottomLeft_x[i,j],oWorldGeneration.creationCellBottomLeft_y[i,j],true)
				
			}
	}
}
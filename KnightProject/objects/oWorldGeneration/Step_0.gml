/* Grid Positioning */

for(var i = 0; i < creationCellAllHeight; i++)
{
	for(var j = 0; j < creationCellAllWidth; j++)
		{
			if(oPlayer.x < creationCellTopRight_x[i,j] && oPlayer.x > creationCellBottomLeft_x[i,j] &&
			   oPlayer.y < creationCellTopRight_y[i,j] && oPlayer.y > creationCellBottomLeft_y[i,j])
			{
				oPlayer_cell_column = i;
				oPlayer_cell_row = j;
			}
		}
}

/* Spawn Terrain */
	for(var i = 0; i < creationCellAllHeight; i++)
	{
		
		
		for(var j = 0; j < creationCellAllWidth; j++)
		{
			
			
			if(oPlayer_cell_column == oTreeTrunk_cell_column[i,j] && oPlayer_cell_row == oTreeTrunk_cell_row[i,j])
			{
				treeInstance = instance_create_depth(oTreeTrunk_x[i,j], oTreeTrunk_y[i,j], 0, oTreeTrunk)
				show_debug_message("Tree was created!\nTree Instance: " + string(treeInstance));
			}
			
			
		}
		
	
	}
	
	if(oPlayer_cell_column != old_oPlayer_cell_column || oPlayer_cell_column != old_oPlayer_cell_column)
			with(treeInstance)
			{
				instance_destroy();
			}
		
		old_oPlayer_cell_column = oPlayer_cell_column;
		old_oPlayer_cell_row = oPlayer_cell_row;
	



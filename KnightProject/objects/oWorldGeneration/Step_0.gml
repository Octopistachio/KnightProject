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
TerrainSpawn(oTreeTrunk_cell_x, oTreeTrunk_cell_y, oTreeTrunk_cell_amount, oTreeTrunk, 0);
		
old_oPlayer_cell_column = oPlayer_cell_column;
old_oPlayer_cell_row = oPlayer_cell_row;
	



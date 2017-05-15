if(consoleEnabled)
{
	draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fGame);
	
	var console = [];
	
	console[0] = "FPS: " + string(round(fps_real));
	console[1] = "Player's Coordinates: (" + string(round(oPlayer.x)) + ", " + string(round(oPlayer.y)) + ")";
	console[2] = "Player's Current Creation Cell: (" + string(oWorldGeneration.oPlayer_cell_row) + ", " + string(oWorldGeneration.oPlayer_cell_column) + ")";
	console[3] = "Numerical Time: " + string(global.time);
	console[4] = "Is Day: " + string(oTime.isDay);
	console[5] = "Player Inside Castle: " + string(global.playerInsideCastle);
			
	for(var i = 0; i<array_length_1d(console); i++)
		draw_text(16,16+(margin*i),string_hash_to_newline(console[i]));
	
}
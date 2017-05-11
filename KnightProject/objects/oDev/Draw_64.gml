if(consoleEnabled)
{
	draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fGame);
    draw_text(64,64,string_hash_to_newline("Time: " + string(global.time)));
    if(!oTime.isDay)
        draw_text(64,64+margin,string_hash_to_newline("Night"));
    else
        draw_text(64,64+margin,string_hash_to_newline("Day"));
    
    if(global.playerInsideCastle)
        draw_text(64,64+margin*2,string_hash_to_newline("Player Inside Castle"));
    else
        draw_text(64,64+margin*2,string_hash_to_newline("Player Outside Castle"));
		
    draw_text(64,64+margin*3,string_hash_to_newline("Player's Coordinates: (" + string(round(oPlayer.x)) + ", " + string(round(oPlayer.y))) + ")");
	
	draw_text(64,64+margin*4,string_hash_to_newline("FPS: " + string(round(fps_real))));
	
	
}
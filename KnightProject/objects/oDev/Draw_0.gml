/* Grid */
if(keyboard_check(ord("G")))
{
	draw_set_alpha(.5);
	
	mp_grid_draw(global.AI_grid);
	
	for(var i = 0; i < room_width; i += 128)
		draw_line(i, 0, i, room_height);
	for(var i = 0; i < room_height; i += 128)
		draw_line(0, i, room_width, i);
		
	draw_path(global.path, x, y, true);

}
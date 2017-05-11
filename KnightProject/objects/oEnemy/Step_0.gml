scr_Define_Path(spawn_x, spawn_y, oPlayer.x, oPlayer.y, pathEnemy);

if(point_direction(x, y, xx, yy) < 6)
{
	pos++;
	if(pos = path_get_number(pathEnemy))
	{
		instance_destroy();
	}
	else
	{
		xx = path_get_point_x(pathEnemy,pos);
		yy = path_get_point_y(pathEnemy,pos);
	}
}

mp_potential_step(xx, yy, moveSpeed, false);

image_angle = direction;
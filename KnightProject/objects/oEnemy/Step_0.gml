if(point_direction(x, y, xx, yy) < 6)
{
	pos++;
	if(pos = path_get_number(global.path))
	{
		instance_destroy();
	}
	else
	{
		xx = path_get_point_x(global.path,pos);
		yy = path_get_point_y(global.path,pos);
	}
}

mp_potential_step(xx, yy, moveSpeed, false);

image_angle = direction;
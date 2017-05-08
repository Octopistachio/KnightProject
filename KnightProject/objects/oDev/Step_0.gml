if(keyboard_check_pressed(ord("B")))
{
	global.time = 0;
}

if(keyboard_check_pressed(ord("N")))
{
	global.time = global.dayEnd;
}

if(keyboard_check_pressed(ord("O")))
{
	oPlayer.x = 10;
	oPlayer.y = 10;
}
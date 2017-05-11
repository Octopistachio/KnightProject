/* Controls */
image_angle = point_direction(x,y,mouse_x,mouse_y);

vspeed=0;
hspeed=0;

if keyboard_check(ord("W")) && place_free(x,y-moveSpeed)
    vspeed = -moveSpeed;
if keyboard_check(ord("S")) && place_free(x,y+moveSpeed)
    vspeed = moveSpeed;
if keyboard_check(ord("A")) && place_free(x-moveSpeed,y)
    hspeed = -moveSpeed;
if keyboard_check(ord("D")) && place_free(x+moveSpeed,y)
    hspeed = moveSpeed;

/* Outside Border */
if(x <= 0 + roomBorderX)
    hspeed = moveSpeed;
if(x >= room_width - roomBorderX)
    hspeed = -moveSpeed;
if(y <= 0 + roomBorderY)
    hspeed = moveSpeed;
if(y >= room_height - roomBorderY)
    hspeed = -moveSpeed;
    
/* Inside Castle */
if(instance_exists(oCastleWallBottomLeft) && instance_exists(oCastleWallTopRight))
{
	if(x > oCastleWallBottomLeft.x &&
    y < oCastleWallBottomLeft.y &&
    x < oCastleWallTopRight.x &&
    y > oCastleWallTopRight.y)
	{
		global.playerInsideCastle = true;
		castleJustEntered = true;
	}
	else
	{
		global.playerInsideCastle = false;
		castleJustExited = true;
		
	}
}

if(castleJustEntered)
	castleJustEntered = false;

if(castleJustExited)
	castleJustExited = false;
	


/* Player Camera */
//Get current size
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

//Get new sizes by interpolating current and target zoomed size
new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);

//Get the shift necessary to re-align the view.
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;

//Scrolling
if(castleJustEntered)
{
	zoom_level = 1;
}
else if(castleJustExited)
{
	zoom_level = 1.5;
}
else
{
	//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly
	zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * rateScrolling), 1, zoom_max);	
}

//Update the view position
camera_set_view_pos(view_camera[0],shift_x, shift_y);


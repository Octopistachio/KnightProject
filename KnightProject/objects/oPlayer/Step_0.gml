//Controls
image_angle = point_direction(x,y,mouse_x,mouse_y);

vspeed=0;
hspeed=0;

if keyboard_check(ord("W"))
    vspeed = -moveSpeed;
if keyboard_check(ord("S"))
    vspeed = moveSpeed;
if keyboard_check(ord("A"))
    hspeed = -moveSpeed;
if keyboard_check(ord("D"))
    hspeed = moveSpeed;

//Outside Border
if(x <= 0 + roomBorderX)
    hspeed = moveSpeed;
if(x >= room_width - roomBorderX)
    hspeed = -moveSpeed;
if(y <= 0 + roomBorderY)
    hspeed = moveSpeed;
if(y >= room_height - roomBorderY)
    hspeed = -moveSpeed;
    
//Inside Castle

if(instance_exists(oCastleWallBottomLeft) && instance_exists(oCastleWallTopRight))
{
	if(x > oCastleWallBottomLeft.x &&
    y < oCastleWallBottomLeft.y &&
    x < oCastleWallTopRight.x &&
    y > oCastleWallTopRight.y)
		global.playerInsideCastle = true;
	else
		global.playerInsideCastle = false;
}

/* Player Camera */
if(global.playerInsideCastle)
{
	//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
	zoom_level = 1;

}
else
{
	//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
	zoom_level = 1.5;

}
	

//Get current size
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

//Get new sizes by interpolating current and target zoomed size
new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);


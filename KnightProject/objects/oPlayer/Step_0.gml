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
    x += moveSpeed;
if(x >= room_width - roomBorderX)
    x -= moveSpeed;
if(y <= 0 + roomBorderY)
    y += moveSpeed;
if(y >= room_height - roomBorderY)
    y -= moveSpeed;
    
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

    


//Controls
image_angle = point_direction(x,y,mouse_x,mouse_y);

if keyboard_check(ord("W"))
    y -= moveSpeed;
if keyboard_check(ord("S"))
    y += moveSpeed;
if keyboard_check(ord("A"))
    x -= moveSpeed;
if keyboard_check(ord("D"))
    x += moveSpeed;

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
if(x > oCastleWallBottomLeft.x &&
    y < oCastleWallBottomLeft.y &&
    x < oCastleWallTopRight.x &&
    y > oCastleWallTopRight.y)
    global.playerInsideCastle = true;
else
    global.playerInsideCastle = false;
    


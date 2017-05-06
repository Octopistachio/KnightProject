x = oPlayer.x;
y = oPlayer.y;

if(keyboard_check(ord("W"))){
    legAngle = 90;
}    
if(keyboard_check(ord("S"))){
    legAngle = 270;
}
if(keyboard_check(ord("A"))){
    legAngle = 180;
}
if(keyboard_check(ord("D"))){
    legAngle = 0;
}

image_angle = legAngle;


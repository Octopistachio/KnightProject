//Follow head
x = oPlayer.x;
y = oPlayer.y;

//Swing left or right if lmouse is clicked
if (mouse_check_button_pressed(mb_left) && !onSwingCoolDown){

    if(side == left)
        side = right;
    else
        side = left;
    wasClicked = true;
    audio_play_sound(aSwordSwingMiss,1,false)
}

//Keep swinging left/right until desired angle is hit
if(wasClicked){
    if(!position_meeting(x,y,oCastleWall)){
        if(side == left){
            if(sideStep<left)
                sideStep += sideVarition;
        }
        else{
            if(sideStep>right)
                sideStep -= sideVarition;
        }
    }        
}

//If desired angle is hit, stop swinging and enable cooldown
if(sideStep==left || sideStep==right){
    wasClicked = false;
}

//Image angle is where player is facing + the left or right swing angle
image_angle = point_direction(x,y,mouse_x,mouse_y) + sideStep;


if(global.playerInsideCastle)
{
	zoom_level = 0;
}

//Make the cursor blink
if(cursorExtendAnimation != sprite_get_number(sCursor))
	cursorExtendAnimation += cursorExtendAnimationTimer;
else
	cursorExtendAnimation = 0;
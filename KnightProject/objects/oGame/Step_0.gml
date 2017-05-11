//Make the cursor blink
if(cursorExtendAnimation != sprite_get_number(sCursor))
	cursorExtendAnimation += cursorExtendAnimationTimer;
else
	cursorExtendAnimation = 0;
/* Shadows */


   
//Player

//Player Legs
with(oPlayerLegs)
{
	draw_shadow(oShadows.playerShadowLength, oShadows.shadowDirection, oShadows.shadowColor, oShadows.shadowAlpha);
    draw_self();
}
   
//Player Legs
with(oPlayerArms)
{
	draw_shadow(oShadows.playerShadowLength, oShadows.shadowDirection, oShadows.shadowColor, oShadows.shadowAlpha);
	draw_self();
}

//Player Head
with(oPlayer)
{
	draw_shadow(oShadows.playerShadowLength, oShadows.shadowDirection, oShadows.shadowColor, oShadows.shadowAlpha);
	draw_self();
}

//Tree Tops
with(oTreeTop)
{
	draw_shadow(30, oShadows.shadowDirection, oShadows.shadowColor, oShadows.shadowAlpha);
	draw_self();
}
   
//Castle Wall
with(oCastleWall)
{
	draw_shadow(50, oShadows.shadowDirection, oShadows.shadowColor, oShadows.shadowAlpha);
}
with(oCastleWall)
{
	draw_self();
}
		
		
		
/* Drawing Layers */
		


		

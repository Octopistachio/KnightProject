/* Shadows */

//Tree Tops
for (var i = 0; i < instance_number(oTreeTop); i += 1)
   {
		var thisInstance = instance_find(oTreeTop,i);
		draw_sprite_shadow(sTreeTop, 0, thisInstance.x, thisInstance.y, 30, shadowDirection, shadowColor, shadowAlpha);
   }
   
//Castle Wall
for (var i = 0; i < instance_number(oCastleWall); i += 1)
   {
		var thisInstance = instance_find(oCastleWall,i);
		draw_sprite_shadow(oCastleWall, 0, thisInstance.x, thisInstance.y, 50, shadowDirection, shadowColor, shadowAlpha);
		with(oCastleWall)
		{
			draw_self();
		}
   }
   
//Player

var playerShadowLength = 20;

//Legs	
draw_sprite_ext_shadow(sPlayerLegs, 0, oPlayerLegs.x, oPlayerLegs.y, 1, 1, oPlayerLegs.image_angle, playerShadowLength, shadowDirection, shadowColor, shadowAlpha);
		
//Arms
draw_sprite_ext_shadow(sPlayerArms, 0, oPlayerArms.x, oPlayerArms.y, 1, 1, oPlayerArms.image_angle, playerShadowLength, shadowDirection, shadowColor, shadowAlpha);
		

//Head
draw_sprite_ext_shadow(sPlayer, 0, oPlayer.x, oPlayer.y, 1, 1, oPlayer.image_angle, playerShadowLength, shadowDirection, shadowColor, shadowAlpha);

		
/* Drawing Layers */

with(oPlayerLegs){ draw_self(); }
		
with(oPlayerArms){ draw_self(); }
		
with(oPlayer){ draw_self(); }

with(oTreeTop){ draw_self(); }

with(oCastleWall){ draw_self(); }
		


		

// DESCRIPTION: Solves strange collision issues when landing or walking into a solid (ground or wall) for platformers
// CREDIT:  cantavanda @ gmc.yoyogames.com
// URL: http://gmc.yoyogames.com/index.php?showtopic=545531
// USE: Apply this script in Player -> Collides With -> Solid event

//CODE: 


if (!place_free(x+hspeed,y))
{
    if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
    if (hspeed>0){move_contact_solid(0,abs(hspeed));}
    hspeed=0;
}
  
if (!place_free(x,y+vspeed))
{
    if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
    if (vspeed>0){move_contact_solid(270,abs(vspeed));}
    vspeed=0;
}

if (!place_free(x+hspeed,y+vspeed))
{
    hspeed=0;
}
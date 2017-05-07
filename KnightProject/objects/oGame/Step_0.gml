//Zoom if player is inside castle
if(global.playerInsideCastle){
    __view_set( e__VW.WView, 0, ScreenWidth );
    __view_set( e__VW.HView, 0, ScreenHeight );
}    
else{
    __view_set( e__VW.WView, 0, ScreenWidth*1.5 );
    __view_set( e__VW.HView, 0, ScreenHeight*1.5 );
}



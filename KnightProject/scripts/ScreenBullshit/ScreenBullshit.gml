/* Screen Bullshit */

window_set_fullscreen(true)

//How big is the screen?
ScreenWidth = display_get_width()
ScreenHeight = display_get_height()

//Set size of window - you don't need to do this in full screen
window_set_size(ScreenWidth,ScreenHeight)

//How much of the room do we want on-screen?
__view_set( e__VW.WView, 0, ScreenWidth )
__view_set( e__VW.HView, 0, ScreenHeight )

//How much of our screen do we want that to take up?
__view_set( e__VW.WPort, 0, ScreenWidth )
__view_set( e__VW.HPort, 0, ScreenHeight )

//Some weird game maker bullshit
surface_resize(application_surface,ScreenWidth,ScreenHeight)


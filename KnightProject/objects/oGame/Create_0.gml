//audio_play_sound(aBackgroundMusic,1,true);
window_set_cursor(cr_none);

/* Variables */

cursorExtendAnimation = 0;
cursorExtendAnimationTimer = 0.1;

guiAlpha = .8;

cellSize = 32;

/* Layers */
layer_create(-999, "Above");
layer_create(999, "Background");
layer_create(0, "Foreground");

/* Views */
//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to 640x480
view_set_wport(0, display_get_width());
view_set_hport(0, display_get_height());

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);

/* Pathing */
global.AI_grid = mp_grid_create(0,0, room_width/cellSize, room_height/cellSize, cellSize, cellSize);

mp_grid_add_instances(global.AI_grid, oCastleWall, false);
mp_grid_add_instances(global.AI_grid, oTreeTrunk, false);
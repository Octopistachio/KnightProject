instance_create_depth(x,y,0,oPlayerArms);
instance_create_depth(x,y,0,oPlayerLegs);
moveSpeed = room_speed/8
roomBorderY = sprite_get_height(sPlayer)/4;
roomBorderX = sprite_get_width(sPlayer)/4;

//dev
global.playerInsideCastle = false

/* Player Camera */
camera = camera_create_view(oPlayer.x, oPlayer.y, 1280, 720, 0, oPlayer, -1, -1, 500, 500);
view_set_camera(0, camera);

zoom_level = 1;

rate = 0.05; //Set the rate of the zoom

//Get the starting view size to be used for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);



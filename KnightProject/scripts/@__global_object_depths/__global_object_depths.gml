// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // oCastleWallTopRight
global.__objectDepths[1] = 0; // oCastleWallBottomLeft
global.__objectDepths[2] = 0; // oGame
global.__objectDepths[3] = 0; // oPlayer
global.__objectDepths[4] = 0; // oPlayerLegs
global.__objectDepths[5] = 0; // oPlayerArms
global.__objectDepths[6] = 0; // oEnemy
global.__objectDepths[7] = 0; // oKing
global.__objectDepths[8] = -100; // oTime
global.__objectDepths[9] = 0; // oCastleWall
global.__objectDepths[10] = 0; // oDev
global.__objectDepths[11] = 999; // oSpawner


global.__objectNames[0] = "oCastleWallTopRight";
global.__objectNames[1] = "oCastleWallBottomLeft";
global.__objectNames[2] = "oGame";
global.__objectNames[3] = "oPlayer";
global.__objectNames[4] = "oPlayerLegs";
global.__objectNames[5] = "oPlayerArms";
global.__objectNames[6] = "oEnemy";
global.__objectNames[7] = "oKing";
global.__objectNames[8] = "oTime";
global.__objectNames[9] = "oCastleWall";
global.__objectNames[10] = "oDev";
global.__objectNames[11] = "oSpawner";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for
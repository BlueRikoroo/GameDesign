global.layerMap = ds_map_create();

enum Dir{
	left = -1,
	right = 1
}

debugMode = false

stageTimer = -1
enum Stage{
	none, fadeIn, flash, warpIn, warpIn2, warpOut, warpOut2
}
stage = Stage.none

warpPoint1x = 0
warpPoint1y = 0
warpPoint2x = 0
warpPoint2y = 0
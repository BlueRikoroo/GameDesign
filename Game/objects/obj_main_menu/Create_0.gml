/// @description 
randomize()
global.currentLevel = 0
#region File Loading
// README: Any value that is a VAR is editable

totalLevels = 8
levelData = noone;
//Level Data is a double array.
//[x, ] = the level, 0->totalLevels
//[, x] = the value, 0=cleared(0 or 1), 1=clearTimeMin, 2=clearTimeSec, 3=coinArray, 
global.coinsAvailable = noone;
//[x] = how many coins are available in each level
for(var i = 0; i < totalLevels; i++)
	global.coinsAvailable[i] = 0 //Default Value
#region Get Coins Available

global.coinsAvailable[0] = 1
global.coinsAvailable[1] = 1
global.coinsAvailable[2] = 2
global.coinsAvailable[3] = 1
global.coinsAvailable[4] = 1
global.coinsAvailable[5] = 0
global.coinsAvailable[6] = 4
global.coinsAvailable[7] = 0
//....
//....

#endregion



//Load Data from File
ini_open("levelData.ini")

for(var i = 0; i < totalLevels; i++){
	var levString = "Level-"+string(i+1)
	levelData[i, 0] = ini_read_real(levString, "Cleared", 0)
	levelData[i, 1] = ini_read_real(levString, "ClearTimeMin", -1)
	levelData[i, 2] = ini_read_real(levString, "ClearTimeSec", 0)
	var coins = []
	for(var c = 0; c < global.coinsAvailable[i]; c++){
		coins[c] = ini_read_real(levString, "Collected:"+string(c), 0) 
	}
	levelData[i,3] = coins	
}

ini_close()

#endregion
#region Needed variables

enum Screen{
	title,
	levelSelect
}
screen = Screen.title

#region TEMP CODE

if keyboard_check(ord("Q"))
	levelData[0, 0] = 1
	
if keyboard_check(ord("D"))
	obj_frame.debugMode = true
	

#endregion

//Level Select Variables
scrollPosHorizontal = 0
scrollPosVerticle = 0

scrollPosCurrentHorizontal = 0
scrollPosCurrentVerticle = 0

scrollAccelHorizontal = 0
scrollAccelVerticle = 0

scrollMaxHorizontal = totalLevels * 90 - 300
scrollMaxVertical = totalLevels * 417

levelSelected = 0
goToSlected = false

levelSelectSurface = surface_create(1524, 734)

newlySelectedTimer = 9

doubleClickTimer = 0
selectLevelSequence = false
selectLevelTimer = 0

frame = 0

#endregion
#region Particles

partSystem = part_system_create()
part_system_depth(partSystem, 50)

leftEmitter = part_emitter_create(partSystem)
rightEmitter = part_emitter_create(partSystem)
part_emitter_region(partSystem, leftEmitter, -100, -50, -100, 1180, ps_shape_rectangle, ps_distr_linear)
part_emitter_region(partSystem, rightEmitter, 1970, 2020, -100, 1180, ps_shape_rectangle, ps_distr_linear)

leftParticle = part_type_create()
rightParticle = part_type_create()

part_type_alpha2(leftParticle, 1, 0)
part_type_alpha2(rightParticle, 1, 0)
part_type_direction(leftParticle, -10, 10, 0, 0)
part_type_direction(rightParticle, 170, 190, 0, 0)
part_type_speed(leftParticle, 2, 10, -0.01, 0)
part_type_speed(rightParticle, 2, 10, -0.01, 0)
part_type_color1(leftParticle, make_color_rgb(255, 255, 255))
part_type_color1(rightParticle, make_color_rgb(255, 255, 255))
part_type_life(leftParticle, 40, 45)
part_type_life(rightParticle, 40, 45)
part_type_shape(leftParticle, pt_shape_square)
part_type_shape(rightParticle, pt_shape_square)
part_type_size(leftParticle, 1, 1, -0.01, 0)
part_type_size(rightParticle, 1, 1, -0.01, 0)
part_type_scale(leftParticle, 1, 2)
part_type_scale(rightParticle, 1, 2)

#endregion
#region Level Name

levelName = noone
for(var i = 0; i < totalLevels; i++){
	levelName[i] = "Unset"	
}

levelName[0] = "The first level!"
levelName[1] = "Must be the second level"
levelName[2] = "These are just..."
levelName[3] = "Placehodler names"
levelName[4] = "My teammates are awesome"
levelName[5] = "Impossible level!"
levelName[6] = "2hard4me"
levelName[7] = "The Final Ascension"

#endregion
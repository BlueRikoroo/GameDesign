/// @description 
#region File Loading
// README: Any value that is a VAR is editable

totalLevels = 7
levelData = noone;
//Level Data is a double array.
//[x, ] = the level, 0->totalLevels
//[, x] = the value, 0=cleared(0 or 1), 1=clearTime, 2=coinArray, 
var coinsAvailable = noone;
//[x] = how many coins are available in each level
for(var i = 0; i < totalLevels; i++)
	coinsAvailable[i] = 0 //Default Value
#region Get Coins Available

coinsAvailable[0] = 2
//....
//....

#endregion



//Load Data from File
ini_open("levelData.ini")

for(var i = 0; i < totalLevels; i++){
	var levString = "Level-"+string(i)
	levelData[i, 0] = ini_read_real(levString, "Cleared", 0)
	levelData[i, 1] = ini_read_real(levString, "ClearTime", 0)
	var coins = []
	for(var c = 0; c < coinsAvailable[i]; c++){
		coins[c] = ini_read_real(levString, "Collected:"+string(c), 0) 
	}
	levelData[i,2] = coins	
}

ini_close()

#endregion
#region Needed variables

enum Screen{
	title,
	levelSelect
}
screen = Screen.title

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

levelName[0] = "Test Level"

#endregion
///@param level

global.currentLevel = argument0

switch(argument0){
case 1:
	room_goto(level_1)
	break
case 2:
	room_goto(level_2)
	break
case 3:
	room_goto(room_example5)
	break
case 4:
	room_goto(level_3)
	break
case 5:
	room_goto(rm_level_1)
	break
case 7:
	room_goto(room_test)
	break
default:
	room_goto(rm_start)
	global.currentLevel = -1
}

if global.currentLevel >= 0{
	for(var i = 0; i < global.coinsAvailable[global.currentLevel-1]; i++)
		obj_frame.coinsCollected[i] = 0
	global.timing = true
}
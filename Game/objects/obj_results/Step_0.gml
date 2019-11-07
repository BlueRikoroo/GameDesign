global.timing = false;

if(keyboard_check_pressed(vk_enter)){
	save_time(global.currentLevel, global.minutes, global.seconds)
	global.minutes = 0;
	global.seconds = 0;
	global.deaths = 0;
	global.timing = true;
	for(var i = 0; i < global.coinsAvailable[global.currentLevel-1]; i++){
		if obj_frame.coinsCollected[i] == 1
			save_coin(global.currentLevel,i)	
	}
	save_level(global.currentLevel)
	load_level(global.currentLevel+1)
}
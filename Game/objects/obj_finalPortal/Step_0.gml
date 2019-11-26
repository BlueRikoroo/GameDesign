/// @description 
// 

part_type_color2(pt, merge_color(c_purple,c_red,(level-1)/3), c_gray)
if level > 0{
	part_emitter_burst(ps,pe,pt,25)	
	if level > 1 and level < 5 and irandom(15*(10-level)) == 0{
		var obj = instance_create_layer(x,y,layer,obj_portalMissle)
		obj.speed = 2.5
		obj.direction = irandom(360)
	}
}

if level == 5{
	endingAlpha += 0.01
	with(obj_portalMissle){
		instance_destroy()	
	}
}

if endingAlpha == 1{
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
	with(obj_timer)
		instance_destroy()
	room_goto(room_credits)	
}
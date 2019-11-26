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
	room_goto(room_credits)	
}
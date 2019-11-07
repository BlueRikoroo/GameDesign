if debugMode{
	if (keyboard_check_pressed(ord("X"))){
		if room_exists(room_next(room))
			room_goto(room_next(room))
	}
	if (keyboard_check_pressed(ord("Z"))){
		if room_exists(room_previous(room))
			room_goto(room_previous(room))
	}
}

stageTimer--

switch(stage){
case Stage.fadeIn:
	if stageTimer <= 0{
		stageTimer = 80
		stage = Stage.flash
	}
	break
case Stage.flash:
	if stageTimer == 65 or stageTimer == 45{
		audio_play_sound(Girl_Landing, 0, 0)	
	}
	if stageTimer <= 0{
		stageTimer = 30
		stage = Stage.warpIn
		audio_play_sound(Warp_Sound, 0, 0)	
		warpPoint1x = obj_camera.char1X
		warpPoint1y = obj_camera.char1Y
		warpPoint2x = obj_camera.char2X
		warpPoint2y = obj_camera.char2Y
	}
	break
case Stage.warpIn:
	if stageTimer <= 0{
		stageTimer = 30
		stage = Stage.warpIn2
		instance_activate_object(obj_player)
		instance_activate_object(obj_rope)
	}
	break
case Stage.warpIn2:
	if stageTimer <= 0{
		stageTimer = 30
		stage = Stage.none
	}
	break
case Stage.warpOut:
	warpPoint1x = obj_portal.x
	warpPoint1y = obj_portal.y
	if stageTimer <= 0{
		stageTimer = 30
		stage = Stage.warpOut2
		instance_destroy(obj_rope)
		instance_destroy(obj_player)
		instance_destroy(obj_portal)
		instance_create_layer(0, 0, get_layer_depth(-10), obj_results)
	}
	with(obj_player){
		var dist = point_distance(x,y-image_yscale*0.5, obj_portal.x, obj_portal.y)
		var dir = point_direction(x,y-image_yscale*0.5, obj_portal.x, obj_portal.y)	
		
		x += lengthdir_x(dist/30,dir)
		y += lengthdir_y(dist/30,dir)
	}
	break
case Stage.warpOut2:
	if stageTimer <= 0{
		stageTimer = 30
		stage = Stage.none
	}
	break
}
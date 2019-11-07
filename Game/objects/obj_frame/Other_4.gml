if instance_exists(obj_player){
	instance_deactivate_object(obj_player)
	instance_deactivate_object(obj_rope)
	
	stageTimer = 80
	stage = Stage.fadeIn
}

stageTimer++

layer = get_layer_depth(-100)
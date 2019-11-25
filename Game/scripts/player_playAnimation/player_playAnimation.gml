/// param animation

image_speed = 1
switch(argument0){
case Anim.idle: 
	if !check_in_array(sprite_index, [anim_default, anim_holdingCrate, anim_hangingOnHandle, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_default
	}
	break
	
case Anim.jumping:
	if !check_in_array(sprite_index, [anim_jumping, anim_holdingCrate, anim_hangingOnHandle, anim_climbingWall, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_jumping
	}
	//Stop jumping on last frame
	if sprite_index == anim_jumping{
		var maxFrames = sprite_get_number(anim_jumping)
		if image_index > maxFrames-1{
			image_index = maxFrames-1
			image_speed = 0
		}
	}
	break
	
case Anim.falling:
	if !check_in_array(sprite_index, [anim_falling, anim_holdingCrate, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_falling
	}
	break
	
case Anim.holdingCrate:
	if sprite_index != anim_holdingCrate{
		image_index = 0
		sprite_index = anim_holdingCrate
	}
	break
	
case Anim.hangingOnHandle:
	if !check_in_array(sprite_index, [anim_hangingOnHandle, anim_holdingCrate]){
		image_index = 0
		sprite_index = anim_hangingOnHandle
	}
	break
	
case Anim.moving:
	if !check_in_array(sprite_index, [anim_moving, anim_jumping, anim_holdingCrate, anim_hangingOnHandle, anim_climbingWall, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_moving
		image_speed = abs(hspeed)/abs(groundSpeed)
	}
	break

case Anim.climbingWall:
	if !check_in_array(sprite_index, [anim_hangingOnHandle, anim_holdingCrate, anim_climbingWall, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_climbingWall
	}
	break
	
case Anim.pullingSelfUpRope:
	if !check_in_array(sprite_index, [anim_hangingOnHandle, anim_holdingCrate, anim_climbingWall, anim_pullingSelfUpRope]){
		image_index = 0
		sprite_index = anim_pullingSelfUpRope
	}
	break
}
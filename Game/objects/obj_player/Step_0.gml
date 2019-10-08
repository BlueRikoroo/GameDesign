var maxRope = false
for(var i = 0; i < array_length_1d(rope_obj); i++){
	if instance_exists(rope_obj[i]) and rope_obj[i].maxReached{
		maxRope = true
		break
	}
}

var onGround = place_meeting(x,y+1,par_wall) or (vspeed > 0 and place_meeting(x,y+1,obj_crate))

#region Jump

if keyboard_check_pressed(c_jump) and onGround{	
	vspeed -= jumpSpeed
}

#endregion
#region Move left and Right

if keyboard_check(c_right){
	faceingDirection = Dir.right
	if onGround
		hspeed = min(hspeed + accelVal, groundSpeed)
	else if hspeed < groundSpeed
		hspeed += accelVal
}
else if keyboard_check(c_left){
	faceingDirection = Dir.left
	if onGround
		hspeed = max(hspeed - accelVal, -groundSpeed)
	else if hspeed > -groundSpeed
		hspeed -= accelVal
}else if (onGround or !maxRope){
	if abs(hspeed) < 1
		hspeed = 0
	else
		hspeed -= sign(hspeed)*0.3
}

#endregion
#region Climb wall if other player is above

if keyboard_check(c_jump) and vspeed >= -2{
	for(var i = 0; i < array_length_1d(rope_obj); i++){
		var otherOnGround = false
		with(attached_obj[i])
			otherOnGround = place_meeting(x,y+1,par_wall)
			
		if attached_obj[i].y < y and otherOnGround{
			if ((keyboard_check(c_left) and attached_obj[i].x < x and place_meeting(x-1,y,par_wall))
			  or (keyboard_check(c_right) and attached_obj[i].x > x and place_meeting(x+1,y,par_wall))){
				vspeed = -2
			}
		}
	}
}

#endregion
#region Wall Jump

if (canWallJump){
	if (keyboard_check_pressed(c_right) and place_meeting(x-1,y,par_wall)){
		hspeed = groundSpeed
		vspeed = -jumpSpeed
	}
	if (keyboard_check_pressed(c_left) and place_meeting(x+1,y,par_wall)){
		hspeed = -groundSpeed
		vspeed = -jumpSpeed
	}
}

#endregion
// Inherit the parent event
event_inherited();

#region Grab handle

if (place_meeting(x,y,obj_Handle)){
	if keyboard_check(c_grab){
		hspeed = 0	
		vspeed = 0
	}
}

#endregion
#region Pushing Giant Wall

if canPushWall{
	var pushSpeed = 1
	if keyboard_check(c_right){
		with (instance_place(x+pushSpeed,y,obj_HWall)){
			if (!place_meeting(x+pushSpeed,y,par_wall)){
				hspeed = pushSpeed
				other.hspeed = pushSpeed
			}
		}
	}
	if keyboard_check(c_left){
		with (instance_place(x-pushSpeed,y,obj_HWall)){
			if (!place_meeting(x-pushSpeed,y,par_wall)){
				hspeed = -pushSpeed
				other.hspeed = -pushSpeed
			}
		}
	}
}

#endregion
#region Standing on Crate

if(vspeed > 0 and place_meeting(x,y+vspeed,obj_crate)){
	//Don't Worry about crates that are higher
	with(obj_crate){
		if other.y > y-height+10
			instance_deactivate_object(self)	
	}
	
	//Find Crate Under and Stand on it
	var obj = instance_place(x, y+vspeed, obj_crate)
	if instance_exists(obj) and y <= obj.y-obj.height+10{
		while(!place_meeting(x,y+1,obj_crate))
			y++
		vspeed = 0
		if keyboard_check_pressed(c_jump){	
			vspeed -= jumpSpeed
		}
	}
	
	//Reactivate all the crates
	instance_activate_object(obj_crate)
}

#endregion

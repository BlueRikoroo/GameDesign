var maxRope = false
for(var i = 0; i < array_length_1d(rope_obj); i++){
	if instance_exists(rope_obj[i]) and rope_obj[i].maxReached{
		maxRope = true
		break
	}
}

var onGround = place_meeting(x,y+1,par_wall)
#region Jump

if keyboard_check_pressed(c_jump) and onGround{	
	vspeed -= jumpSpeed
}

#endregion
#region Move left and Right

if keyboard_check(c_right){
	if onGround
		hspeed = min(hspeed + accelVal, groundSpeed)
	else
		hspeed += accelVal*0.5
}
else if keyboard_check(c_left){
	if onGround
		hspeed = max(hspeed - accelVal, -groundSpeed)
	else
		hspeed -= accelVal*0.5
}else if (onGround or !maxRope){
	if abs(hspeed) < 1
		hspeed = 0
	else
		hspeed -= sign(hspeed)*0.3
}

#endregion

// Inherit the parent event
event_inherited();

if (place_meeting(x,y,obj_Handle)){
	if keyboard_check(c_space){
		hspeed = 0	
		vspeed = 0
	}
}

if (place_meeting(x+1,y,obj_HWall)){
	
	if keyboard_check(c_right){
		hspeed = obj_HWall.hspeed
		obj_HWall.hspeed += .25
	}
}
if (!place_meeting(x+1,y,obj_HWall)){
	if (obj_HWall.hspeed > 0){
		obj_HWall.hspeed = 0
	}
}
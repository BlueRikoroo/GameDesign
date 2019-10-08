var maxRope = false
for(var i = 0; i < array_length_1d(rope_obj); i++){
	if instance_exists(rope_obj[i]) and rope_obj[i].maxReached{
		maxRope = true
		break
	}
}

var onGround = place_meeting(x,y+1,par_wall) or place_meeting(x,y+1,obj_crate)

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

if (onGround and place_meeting(x,y,obj_Handle)){
	if keyboard_check(c_grab){
		hspeed = 0	
		vspeed = 0
	}
}

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

if(vspeed > 0 and place_meeting(x,y+vspeed,obj_crate)){
	var obj = instance_place(x, y+vspeed, obj_crate)
	if y <= obj.y-obj.height{
		while(!place_meeting(x,y+1,obj_crate))
			y++
		vspeed = 0
		if keyboard_check_pressed(c_jump){	
			vspeed -= jumpSpeed
		}
	}
}

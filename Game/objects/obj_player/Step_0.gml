var maxRope = false
for(var i = 0; i < array_length_1d(rope_obj); i++){
	if instance_exists(rope_obj[i]) and rope_obj[i].maxReached{
		maxRope = true
		break
	}
}

var onGround = place_meeting(x,y+1,par_wall)
var accelVal = 0.3
#region Jump

if keyboard_check_pressed(c_jump) and onGround{	
	vspeed -= 20
}

#endregion
#region Move left and Right

if keyboard_check(c_right){
	if onGround
		hspeed = min(hspeed + accelVal, 5)
	else
		hspeed += accelVal*0.5
}
else if keyboard_check(c_left){
	if onGround
		hspeed = max(hspeed - accelVal, -5)
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


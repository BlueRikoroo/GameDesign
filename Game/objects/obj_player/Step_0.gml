
#region Jump

if keyboard_check_pressed(c_jump) and place_meeting(x,y+1,par_wall){	
	vspeed -= 20
}

#endregion
#region Move left and Right

if keyboard_check(c_right)
	hspeed = min(hspeed + 0.3, 5)
else if keyboard_check(c_left)
	hspeed = max(hspeed - 0.3, -5)
else if abs(hspeed) < 1
	hspeed = 0
else
	hspeed -= sign(hspeed)*0.3

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
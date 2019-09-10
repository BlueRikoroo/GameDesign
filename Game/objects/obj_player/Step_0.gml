
#region Jump

if keyboard_check_pressed(vk_space) and place_meeting(x,y+1,par_wall){	
	vspeed -= 20
}

#endregion
#region Move left and Right

if keyboard_check(vk_right)
	hspeed = min(hspeed + 0.3, 5)
else if keyboard_check(vk_left)
	hspeed = max(hspeed - 0.3, -5)
else if abs(hspeed) < 1
	hspeed = 0
else
	hspeed -= sign(hspeed)*0.3

#endregion

// Inherit the parent event
event_inherited();


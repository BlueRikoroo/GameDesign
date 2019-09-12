

#region Gravity

vspeed += 0.6

#endregion
#region Collisions

#region Verticle Collision

if vspeed != 0 and place_meeting(x,y+vspeed,par_wall){
	//Determine which direction the entity is moving (positive / negative)
	var dir = sign(vspeed)
	
	//Move the entity to the wall
	while(!place_meeting(x,y+dir,par_wall)){
		y+=dir	
	}
	
	//Stop moving
	vspeed = 0
}

#endregion
#region Horizontal Collision

if hspeed != 0 and place_meeting(x+hspeed,y,par_wall){
	//Determine which direction the entity is moving (positive / negative)
	var dir = sign(hspeed)
	
	//Move the entity to the wall
	while(!place_meeting(x+dir,y,par_wall)){
		x+=dir	
	}
	
	//Stop moving
	hspeed = 0
}

#endregion

#endregion

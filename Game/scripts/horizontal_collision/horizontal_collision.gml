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
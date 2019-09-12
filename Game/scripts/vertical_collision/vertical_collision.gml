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
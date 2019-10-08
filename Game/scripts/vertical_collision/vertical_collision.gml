/// @param collisionObj

if vspeed != 0 and place_meeting(x,y+vspeed,argument0){
	//Determine which direction the entity is moving (positive / negative)
	var dir = sign(vspeed)
	
	//Move the entity to the wall
	while(!place_meeting(x,y+dir,argument0)){
		y+=dir	
	}
	
	//Stop moving
	vspeed = 0
}
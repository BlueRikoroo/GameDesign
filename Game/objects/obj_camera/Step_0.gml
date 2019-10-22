if (instance_exists(character1) and instance_exists(character2)){
	goToX = (character1.x + character2.x)*0.5
	goToY = (character1.y + character2.y)*0.5
	
	var dist = point_distance(currentX, currentY, goToX, goToY)*0.1 //0.1 is the percentage to move
	var dir = point_direction(currentX, currentY, goToX, goToY)
	
	currentX += lengthdir_x(dist, dir)
	currentY += lengthdir_y(dist, dir)
	
	camera_set_view_pos(camera, currentX - currentWidth*0.5, currentY - currentHeight*0.5)
}
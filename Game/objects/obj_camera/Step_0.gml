if instance_exists(character1){
	char1X = character1.x
	char1Y = character1.y
}
if instance_exists(character2){
	char2X = character2.x
	char2Y = character2.y
}
var halfWidth = currentWidth*0.5
var halfHeight = currentHeight*0.5
	
//Update Current Pos
goToX = (char1X +char2X)*0.5
goToY = (char2Y + char2Y)*0.5
	
var dist = point_distance(currentX, currentY, goToX, goToY)*0.1 //0.1 is the percentage to move
var dir = point_direction(currentX, currentY, goToX, goToY)
	
currentX += lengthdir_x(dist, dir)
currentY += lengthdir_y(dist, dir)
	
//Stop Camera at borders
//Left Border
if halfWidth > currentX{
	currentX = halfWidth	
}
//Right Border
if room_width-halfWidth < currentX{
	currentX = room_width-halfWidth	
}
//Top Border
if halfHeight > currentY{
	currentY = halfHeight
}
//Bottom Border
if room_height-halfHeight < currentY{
	currentY = room_height-halfHeight	
}
	
camera_set_view_pos(camera, currentX - halfWidth, currentY - halfHeight)
#region Make sure both ends of rope exist, update position of x and y

if instance_exists(obj1){
	x1 = obj1.x
	y1 = obj1.y - 16*obj1.image_yscale
}else{
	obj1 = instance_create_layer(x1,y1,get_layer_depth(0),par_entity)
}
if instance_exists(obj2){
	x2 = obj2.x
	y2 = obj2.y - 16*obj2.image_yscale
}else{
	obj2 = instance_create_layer(x2,y2,get_layer_depth(0),par_entity)
}

#endregion
#region Limit Rope

length = point_distance(x1,y1, x2,y2)

maxReached = length > maxLength
	
#endregion
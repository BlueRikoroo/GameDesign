var grav = 0.6
#region Rope Collision

if collision_type == 1 and rope_obj.maxReached{
	var x2 = attached_obj.x
	var y2 = attached_obj.y
	
	var dir = point_direction(x,y,x2,y2)
	var dist = point_distance(x,y,x2,y2)
	
	var x1next = x+hspeed
	var y1next = y+vspeed
	var x2next = x2 + attached_obj.hspeed
	var y2next = y2 + attached_obj.vspeed
	
	var distNext = point_distance(x1next,y1next,x2next,y2next)
	
	var systHSpeed = hspeed+attached_obj.hspeed
	var systVSpeed = vspeed+attached_obj.vspeed
	
	var dirDiff1 = dirDiff(direction, dir)
	var dirDiff2 = dirDiff(attached_obj.direction, dir + 180)
	
	if distNext > dist{
		var addedForce = 1.2
		
		var ang = degtorad(dir)
		var oldHSpeed = hspeed
		var oldVSpeed = vspeed
		hspeed = systHSpeed * 0.5 + addedForce*cos(ang)
		vspeed = systVSpeed * 0.5 - addedForce*sin(ang)
		
		//ang += sign(dirDiff1)*degtorad(-90)
		//hspeed += oldHSpeed * cos(ang)
		//vspeed += oldVSpeed * -sin(ang)
	
		ang = degtorad(dir+180)
		oldHSpeed = attached_obj.hspeed
		oldVSpeed = attached_obj.vspeed
		attached_obj.hspeed = systHSpeed * 0.5 + addedForce*cos(ang)
		attached_obj.vspeed = systVSpeed * 0.5 - addedForce*sin(ang)
		
		//ang += sign(dirDiff2)*degtorad(-90)
		//attached_obj.hspeed += oldHSpeed * cos(ang)
		//attached_obj.vspeed += oldVSpeed * -sin(ang)
	}
}

#endregion
#region Collisions
switch(collision_type){
case 0: #region Normal Collisions

//Gravity
vspeed += grav

vertical_collision()
horizontal_collision()

break #endregion
case 1: #region Rope Collision

//Gravity
vspeed += grav
with(attached_obj)
	vspeed += grav

vertical_collision()
horizontal_collision()

with(attached_obj){
	vertical_collision()
	horizontal_collision()
}

break #endregion
}



#endregion

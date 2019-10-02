var grav = 0.6
#region Gravity

if collision_type == 0{ #region Normal

	vspeed += grav

} #endregion
else if collision_type == 1{ #region Rope

	vspeed += grav
	with(attached_obj)
		vspeed += grav

}#endregion

#endregion
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
	
	
	if distNext >= dist{
		
		var pow = abs(lengthdir_x(speed, -(dir+180)+direction))
		hspeed += lengthdir_x(pow, dir)
		vspeed += lengthdir_y(pow, dir)
	
		pow = abs(lengthdir_x(attached_obj.speed, -(dir)+attached_obj.direction))
		attached_obj.hspeed += lengthdir_x(pow, dir+180)
		attached_obj.vspeed += lengthdir_y(pow, dir+180)
		
		if (rope_obj.length/rope_obj.maxLength > 1.1){
			var pullback = rope_obj.length/rope_obj.maxLength
			hspeed += lengthdir_x(pullback, dir)
			vspeed += lengthdir_y(pullback, dir)
			attached_obj.hspeed += lengthdir_x(pullback, dir+180)
			attached_obj.vspeed += lengthdir_y(pullback, dir+180)
		}
	}
}

#endregion
#region Collisions


if collision_type == 0{ #region Normal Collisions

	vertical_collision()
	horizontal_collision()

} #endregion
else if collision_type == 1{ #region Rope Collision



	vertical_collision()
	horizontal_collision()

	with(attached_obj){
		vertical_collision()
		horizontal_collision()
	}

} #endregion

#endregion

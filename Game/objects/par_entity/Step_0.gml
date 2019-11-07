var grav = 0.6
#region Gravity

if enableGravity
	vspeed += grav

#endregion
#region Rope Collision

for(var i = 0; i < array_length_1d(rope_obj); i++){
	if rope_obj[i] != noone and rope_obj[0].maxReached{
		var x2 = attached_obj[i].x
		var y2 = attached_obj[i].y
    
    var dir = point_direction(x,y,x2,y2)
    
		if abs(dirDiff(direction,dir)) >= 90{
		
			var pow = abs(lengthdir_x(speed, -(dir+180)+direction))
			hspeed += lengthdir_x(pow, dir)
			vspeed += lengthdir_y(pow, dir)
		
			if (rope_obj[0].length/rope_obj[0].maxLength > 1.1){
				var pullback = rope_obj[0].length/rope_obj[0].maxLength
				hspeed += lengthdir_x(pullback, dir)
				vspeed += lengthdir_y(pullback, dir)
			}
		}
	}
}

#endregion
#region Collisions

vertical_collision(par_wall)
horizontal_collision(par_wall)

#endregion


#region Collisions
switch(collision_type){
case 0: #region Normal Collisions

//Gravity
vspeed += 0.6

vertical_collision()
horizontal_collision()

break #endregion
case 1: #region Rope Collision

//Gravity
vspeed += 0.6
with(attached_obj)
	vspeed += 0.6

vertical_collision()
horizontal_collision()

with(attached_obj){
	vertical_collision()
	horizontal_collision()
}

break #endregion
}



#endregion

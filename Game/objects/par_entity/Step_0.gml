var grav = 0.6
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

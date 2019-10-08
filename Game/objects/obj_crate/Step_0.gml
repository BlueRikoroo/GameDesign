/// @description 
// 
if (parent == noone)
{
	event_inherited();

	vertical_collision(obj_crate)
	horizontal_collision(obj_crate)
}
else
{
	x = parent.x
	y = parent.y
}


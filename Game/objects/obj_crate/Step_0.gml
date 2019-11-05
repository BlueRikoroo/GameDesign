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
	if(!instance_exists(parent))
	{
		parent = noone;
	}
	else
	{
		x = parent.x
		y = parent.y
	}
}
#region landing sound
var curr_coll = place_meeting(x,y+1,par_wall);
var prev_coll = place_meeting(xprevious,yprevious+1,par_wall);


if ( (curr_coll==1) && (prev_coll==0) )
{
    audio_play_sound(Crate_Fall,10,false);
}
#endregion


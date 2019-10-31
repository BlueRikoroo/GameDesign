#region End Level

if (place_meeting(x,y,obj_player))
{
	room_goto(rm_results);
	global.roomcounter += 1;
}
#endregion
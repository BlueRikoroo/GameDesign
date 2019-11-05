#region End Level
if (place_meeting(x,y,obj_player))
{
	audio_play_sound(Warp_Sound,10, false);
	room_goto(rm_results);
	global.roomcounter += 1;
}
#endregion
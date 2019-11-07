#region End Level

if (place_meeting(x,y,obj_player) and obj_frame.stage != Stage.warpOut)
{
	audio_play_sound(Warp_Sound,10, false);
	obj_frame.stage = Stage.warpOut
	obj_frame.stageTimer = 30
	global.roomcounter = room;
}

#endregion
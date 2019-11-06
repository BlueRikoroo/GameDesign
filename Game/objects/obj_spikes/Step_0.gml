if(place_meeting(x,y+1,obj_player))
{
	audio_play_sound(Spike_Death,10,false);
	room_restart();
}
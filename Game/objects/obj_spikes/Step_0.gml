if(place_meeting(x,y+1,obj_player))
{
	audio_play_sound(Spike_Death,10,false);
	global.deaths +=1;
	room_restart();
}
if(place_meeting(x,y-1,obj_Platform) and room != room_finalChallenge)
{
	var Pinstance = instance_place(x, y+1, obj_Platform);
	vspeed = Pinstance.vertical_speed * Pinstance.dir;
}
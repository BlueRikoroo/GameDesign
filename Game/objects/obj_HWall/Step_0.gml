vspeed += 0.6
vertical_collision(par_wall)

#region landing sound
var curr_coll = place_meeting(x,y+1,par_wall);
var prev_coll = place_meeting(xprevious,yprevious+1,par_wall);


if ( (curr_coll==1) && (prev_coll==0) )
{
    audio_play_sound(Heavy_Wall_Thud,10,false);
}
#endregion
#region Being pushed sound
if(hspeed > 0 and vspeed == 0)
{
	audio_play_sound(Heavy_Wall_Scrape,1,false);
}
if(vspeed > 0)
{
	audio_stop_sound(Heavy_Wall_Scrape);	
}
#endregion
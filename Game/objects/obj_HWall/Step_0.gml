vspeed += 0.6
vertical_collision(par_wall)
var curr_coll = place_meeting(x,y+1,par_wall);
var prev_coll = place_meeting(xprevious,yprevious+1,par_wall);

// Play sound if walk/jump on a musical block
if ( (curr_coll==1) && (prev_coll==0) )
{
    audio_play_sound(Heavy_Wall_Thud,10,false);
}
if(hspeed > 0 and vspeed = 0)
{
	audio_play_sound(Heavy_Wall_Scrape,1,false);
}

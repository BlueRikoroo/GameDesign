if(global.timing == true)
{
	global.seconds += 1/60;

	if (global.seconds == 60)
	{
		global.minutes += 1;
		global.seconds = 0
	}
}
if(room != rm_splash and room != rm_start)
{
	audio_play_sound(choose(BG_Music_1,BG_Music_2), 5, false);	
}




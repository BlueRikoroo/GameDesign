if(global.timing == true)
{
	global.seconds += 1/60;

	if (global.seconds >= 60){
		global.minutes += 1;
		global.seconds = 0
	}
}

if(room != rm_splash and room != rm_start and global.wait <= 0)
{
	var song = choose(BG_Music_1,BG_Music_2);
	audio_play_sound(song, 10, false);
	
	if(song == BG_Music_1)
		global.wait = 196.5;
	if(song == BG_Music_2)
		global.wait = 253.3;
	
}
if room != rm_splash
	global.wait -= 1/60;



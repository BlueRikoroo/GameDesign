if(room = rm_start)
{
	audio_play_sound(Title_Screen,10,false);
}
if(keyboard_check_pressed(vk_enter))
{
	room_goto(room_next(room));
	audio_stop_sound(Title_Screen);
	global.timing = true;
	global.roomcounter +=1;
}

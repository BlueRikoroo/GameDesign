
if(keyboard_check_pressed(vk_enter))
{
	room_goto(room_next(room));
	audio_stop_sound(Title_Screen);
	audio_play_sound(Warp_Sound,10,false);
	global.timing = true;
}

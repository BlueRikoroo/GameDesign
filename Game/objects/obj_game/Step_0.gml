if(keyboard_check_pressed(vk_enter))
{
	room_goto(room_next(room));
	global.timing = true;
	global.roomcounter +=1;
}
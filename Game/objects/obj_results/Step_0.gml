global.timing = false;

if(keyboard_check_pressed(vk_enter))
{	global.minutes = 0;
	global.seconds = 0;
	global.deaths = 0;
	global.timing = true;
	room_goto(global.roomcounter + 1);
}
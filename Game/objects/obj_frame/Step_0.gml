if (keyboard_check_pressed(ord("X"))){
	if room_exists(room_next(room))
		room_goto(room_next(room))
}
if (keyboard_check_pressed(ord("Z"))){
	if room_exists(room_previous(room))
		room_goto(room_previous(room))
}
/// @description Insert description here
// You can write your code in this editor
global.wait = 0;

if (!obj_frame.credits)
	audio_play_sound(Title_Screen,10,false);

if (obj_frame.debugMode){
	room_goto_next();
}
/// @description Insert description here
// You can write your code in this editor

//These aren't affected by gravity
grav = 0.0;

//If a player touches the collectable, trigger flag
if(place_meeting(x,y,obj_player))
{
	if(!collected) //Only play sound once, upon actually collecting the item.
	{
		audio_play_sound(snd_gotCollectable, 1, false);
		global.levelCollected += 1;
		global.totalCollected += 1;
	}
	collected = true;
}

if(collected)
{
	//Fly away
	image_angle += 30;
	vspeed = -20;
}
else
{
	//Spin in place
	image_angle += 1;
}
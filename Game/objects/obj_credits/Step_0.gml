timer++
switch(stage){
case 0:
	if timer > 300{
		timer = 0
		stage = 1
		audio_play_sound(bgm_credits,10,true)
	}
	break
case 1: case 2: case 3: case 4: case 5: case 6:
	if timer > 300{
		timer = 0
		stage += 1
	}
	break
case 7:
	alpha += 0.003
}
//Title
//Programming
//Art Design
//Level Design
//End Level / Credit assets
//Everyone

if alpha > 0
	alpha -= 0.001
if alpha >= 1{
	room_goto(rm_splash)	
}
	
walkingTimer += 0.2
frame++
#region Selecting Things

switch(screen){
case Screen.title: #region

	if levelData[0, 0] == 0{
		if(keyboard_check_pressed(vk_enter))
		{
			room_goto(room_next(room));
			audio_stop_sound(Title_Screen);
			audio_play_sound(Warp_Sound,10,false);
			global.timing = true;
		}
	}else{
		screen = Screen.levelSelect
	}
	
	break; #endregion
case Screen.levelSelect: #region
	if mouse_in_region(200, 350, 200+1524, 350+734){
		if mouse_wheel_up()
			scrollAccelVerticle += 20
		if mouse_wheel_down()
			scrollAccelVerticle -= 20	
	}
	
	if mouse_in_region(0, 200, 1920, 400){
		if mouse_wheel_up()
			scrollAccelHorizontal += 20
		if mouse_wheel_down()
			scrollAccelHorizontal -= 20	
	}
	
	var xpos, ypos
	if mouse_check_button_pressed(mb_left){
		for(var i = 0; i < totalLevels; i++){
			xpos = 325+90*i
			if mouse_in_region(xpos-40-scrollPosCurrentHorizontal, 225, xpos+40-scrollPosCurrentHorizontal, 375){
				levelSelected = i
				scrollAccelVerticle = 0
				scrollAccelHorizontal = 0
				scrollPosVerticle = 180*i
				scrollPosHorizontal = -400+90*i
			}
			ypos = 180*i+417-scrollPosCurrentVerticle
			if ypos > 100 and mouse_in_region(200,350-100+ypos,1724,350+100+ypos){
				levelSelected = i
				scrollAccelVerticle = 0
				scrollAccelHorizontal = 0
				scrollPosVerticle = 180*i
				scrollPosHorizontal = -400+90*i
			}
		}
	}
	
	//Keyboard Input
	if levelSelected < totalLevels-1
	  and (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
	  or keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))){
		levelSelected++
		scrollAccelVerticle = 0
		scrollAccelHorizontal = 0
		scrollPosVerticle = 180*levelSelected
		scrollPosHorizontal = -400+90*levelSelected
	}
	if levelSelected > 0
	  and (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
	  or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))){
		levelSelected--
		scrollAccelVerticle = 0
		scrollAccelHorizontal = 0
		scrollPosVerticle = 180*levelSelected
		scrollPosHorizontal = -400+90*levelSelected
	}
	
	if scrollAccelVerticle > 0
		scrollAccelVerticle -= 5
	if scrollAccelVerticle < 0
		scrollAccelVerticle += 5
		
	if scrollAccelHorizontal > 0
		scrollAccelHorizontal -= 5
	if scrollAccelHorizontal < 0
		scrollAccelHorizontal += 5
		
	scrollPosVerticle += scrollAccelVerticle
	scrollPosHorizontal += scrollAccelHorizontal
	
	if scrollPosVerticle < 0
		scrollPosVerticle = 0
	if scrollPosVerticle > scrollMaxVertical
		scrollPosVerticle = scrollMaxVertical
		
	if scrollPosHorizontal < 0
		scrollPosHorizontal = 0
	if scrollPosHorizontal > scrollMaxHorizontal
		scrollPosHorizontal = scrollMaxHorizontal
	
	if scrollPosVerticle < scrollPosCurrentVerticle or scrollPosVerticle > scrollPosCurrentVerticle
		scrollPosCurrentVerticle += (scrollPosVerticle-scrollPosCurrentVerticle)*0.1
	if scrollPosHorizontal < scrollPosCurrentHorizontal or scrollPosHorizontal > scrollPosCurrentHorizontal
		scrollPosCurrentHorizontal += (scrollPosHorizontal-scrollPosCurrentHorizontal)*0.1

	break #endregion
}

#endregion
#region Particles

repeat(5){
	var c = irandom(255)
	part_type_color1(leftParticle, make_color_rgb(c, c, c))
	c = irandom(255)
	part_type_color1(rightParticle, make_color_rgb(c, c, c))	
	
	part_emitter_burst(partSystem, leftEmitter, leftParticle, 1)
	part_emitter_burst(partSystem, rightEmitter, rightParticle, 1)
}

#endregion
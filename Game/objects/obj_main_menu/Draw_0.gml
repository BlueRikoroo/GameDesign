switch(screen){
case Screen.title: #region

	draw_set_font(ft_title);
	draw_set_halign(fa_center);
	var c = c_white;
	var c1 = c_gray;
	var c2 = c_black;
	var c3 = c_white;
	draw_text_transformed_color(
		room_width/2, 200, "SOUL CHAIN", 3, 3, 0,
		c,c1,c2,c3,1
		);
	draw_set_font(ft_time);

	var startMessage = "PRESS ENTER TO START"
	if levelData[0, 0] == 1{
		startMessage = "PRESS ENTER TO CONTINUE"
	}
	draw_text_transformed_color(
		room_width/2, 800, startMessage, 1, 1, 0,
		c,c1,c2,c3,1
		);
	draw_set_halign(fa_left);
	
	break #endregion
case Screen.levelSelect: #region

	var c1 = c_white;
	var c2 = c_gray;
	var c3 = c_black;
	var c4 = c_white;
	surface_set_target(levelSelectSurface)
	
	draw_clear_alpha(c_black, 0)
	//draw_set_color(c_white)
	//draw_rectangle(0,0,1524,734,false)
	
	var offset;
	var ypos;
	for(var i = 0; i < totalLevels; i++){
		offset = cos(frame*0.02-0.2*i)*30
		ypos = 180*i+417-scrollPosCurrentVerticle
		draw_sprite(spr_levelPreview, i, 300+offset, ypos)
		if levelSelected = i{
			draw_sprite(spr_levelSelector, 0, 100+offset, ypos) 	
		}
		draw_set_color(c_white) draw_set_halign(fa_left) draw_set_valign(fa_middle)
		draw_text_transformed_color(450+offset, ypos-25, levelName[i], 1, 1, 0, c1, c2, c3, c4, 1)
		draw_text_transformed_color(450+offset, ypos+25, levelData[i, 1], 1, 1, 0, c1, c2, c3, c4, 1)
	}
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(spr_alphaGradient, 0, 1524, 0, 0.25, 153, 270, -1, 1)
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()

	draw_set_font(ft_title);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top)
	draw_text_transformed_color(
		room_width/2, 000, "Level Select", 3, 3, 0,
		c1,c2,c3,c4,1
		);
	draw_set_font(ft_time);
	
	draw_surface(levelSelectSurface, 200, 350)
	
	var xpos
	for(var i = 0; i < totalLevels; i++) {
		xpos = 325+90*i
		if xpos-scrollPosCurrentHorizontal < 325
			draw_set_alpha(max(0,(xpos-scrollPosCurrentHorizontal-200)/125))
		
		offset = cos(frame*0.02-0.2*i-2)*20
		
		draw_set_color(merge_color(c_white, c_black, random(0.1)+0.45))
		if levelSelected == i{
			draw_set_color(merge_color(c_yellow,c_orange,0.5 + 0.2*cos(frame*0.2)))
		}
		var e = 100*(levelSelected==i)
		draw_rectangle(xpos-38.125-scrollPosCurrentHorizontal, 300+offset-23.875, xpos+38.125-scrollPosCurrentHorizontal, 300+offset+23.875+e, false)
		
		draw_sprite_ext(spr_levelPreview, i, xpos-scrollPosCurrentHorizontal, 300+offset, 0.25, 0.25, 0, -1, draw_get_alpha())
		
		draw_set_color(c_white)
		if levelSelected == i
			draw_set_color(c_black)
		draw_text(xpos-scrollPosCurrentHorizontal, 325+offset + 25, string(i+1))
		
		draw_set_alpha(1)
	}
	
	break #endregion
}




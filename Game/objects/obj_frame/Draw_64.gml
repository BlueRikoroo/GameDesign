switch(stage){
case Stage.fadeIn:

	if stageTimer > 0{
		draw_set_alpha(stageTimer/80)
		draw_set_color(c_black)
		draw_rectangle(0,0,1920,1080,false)
		draw_set_alpha(1)
	}
	break
case Stage.flash:
	draw_set_alpha(0)
	if stageTimer <= 65 and stageTimer > 55{
		draw_set_alpha((stageTimer-56)/10)
	}
	if stageTimer <= 45 and stageTimer > 35{
		draw_set_alpha((stageTimer-36)/10)
	}
	draw_set_color(c_black)
	draw_rectangle(0,0,1920,1080,false)
	draw_set_alpha(1)
	break
}
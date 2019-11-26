if fired{
	part_emitter_region(ps,pe,x-1,x+1,y-1,y+1,ps_shape_ellipse,ps_distr_gaussian)
	part_emitter_burst(ps,pe,pt2,4)
	
	direction = point_direction(x,y,obj_finalPortal.x,obj_finalPortal.y)
	speed = 10
	
	if x > obj_finalPortal.x-5 and x < obj_finalPortal.x+5
	  and y > obj_finalPortal.y-5 and y < obj_finalPortal.y+5{
		obj_finalPortal.level+=1
		if obj_finalPortal.level = 5{
			audio_stop_all()	
		}
		audio_play_sound(Warp_Sound,5,false)
		instance_destroy()
	}
}else{
	if collision_circle(x,y,5,obj_player,0,0){
		fired = true
		audio_play_sound(snd_gotCollectable,5,false)
	}
	part_emitter_burst(ps,pe,pt1,2)
}
/// @description 
// 

// Inherit the parent event
event_inherited();


if y != 1662{
	if !activated and place_meeting(x+400, y-5, obj_player){
		activated = true
		vertical_speed = 1
		
		audio_stop_all()
		audio_play_sound(bgm_finalBoss,10,true)
		
		obj_finalPortal.level = 1
		
		with(obj_finalRisingSpikes)
			vspeed = 0
	}
	if y < 3974
		vertical_speed = 2
	if y < 3796
		vertical_speed = 4
	if y < 3329
		vertical_speed = 8
	if y < 2504
		vertical_speed = 4
	if y < 2000
		vertical_speed = 2
	if y < 1750
		vertical_speed = 1
	if y < 1663{
		y = 1662
		vertical_speed = 0
	}
	if activated{
		part_emitter_region(ps,pe,x,x+128*image_xscale,y+16,y+16,ps_shape_line,ps_distr_gaussian)
		part_emitter_burst(ps,pe,pt,20)
	}
}

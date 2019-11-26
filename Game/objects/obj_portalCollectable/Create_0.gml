fired = false

ps = part_system_create()

pe = part_emitter_create(ps)
part_emitter_region(ps,pe,x-1,x+1,y-1,y+1,ps_shape_ellipse,ps_distr_gaussian)

pt1 = part_type_create()
part_type_alpha2(pt1,1,0)
part_type_shape(pt1, pt_shape_ring)
part_type_speed(pt1,0.01,0.05,0,0)
part_type_direction(pt1,0,360,0,0)
part_type_life(pt1,3,7)
part_type_color2(pt1,c_green,c_lime)


pt2 = part_type_create()
part_type_alpha2(pt2,1,0)
part_type_shape(pt2, pt_shape_cloud)
part_type_speed(pt2,0.01,0.05,0,0)
part_type_direction(pt2,0,360,0,0)
part_type_life(pt2,10,20)
part_type_color2(pt2,c_yellow,c_orange)
part_type_orientation(pt2,0,360,0,2,false)
part_type_size(pt2,1,1,-0.05,0)
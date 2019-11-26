ps = part_system_create()

pe = part_emitter_create(ps)
part_emitter_region(ps,pe,x-1,x+1,y-1,y+1,ps_shape_ellipse,ps_distr_gaussian)


pt = part_type_create()
part_type_alpha2(pt,1,0)
part_type_shape(pt, pt_shape_cloud)
part_type_speed(pt,0.01,0.05,0,0)
part_type_direction(pt,0,360,0,0)
part_type_life(pt,10,20)
part_type_color2(pt,c_red,c_orange)
part_type_orientation(pt,0,360,0,2,false)
part_type_size(pt,1,1,-0.05,0)

part_emitter_stream(ps,pe,pt,4)

image_xscale = 0.2
image_yscale = 0.2
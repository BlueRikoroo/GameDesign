level = 0

endingAlpha = 0






ps = part_system_create()

pe = part_emitter_create(ps)
var size = 100
part_emitter_region(ps,pe,x-size,x+size,y-size,y+size,ps_shape_ellipse,ps_distr_gaussian)

pt = part_type_create()
part_type_shape(pt, pt_shape_cloud)
part_type_life(pt,15,30)
part_type_speed(pt,15,20,0,0)
part_type_direction(pt,0,360, 10, 0)
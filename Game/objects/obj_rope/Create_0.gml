obj1 = noone
obj2 = noone
x1 = 0
y1 = 0
x2 = 0
y2 = 0
length = 0
maxReached = false
maxLength = 100
tempMaxReduction = 0

surf = surface_create(40, 300)
ps = part_system_create()

pe = part_emitter_create(ps)
part_emitter_region(ps,pe,15,25,0,0,ps_shape_rectangle,ps_distr_linear)

pt = part_type_create()
part_type_shape(pt, pt_shape_sphere)
part_type_size(pt, 0.1, 0.2, 0, 0.2)
part_type_speed(pt,7,10,0,0)
part_type_direction(pt,270, 270, 0, 1)
part_type_life(pt, 30, 30)

part_system_automatic_draw(ps, false)
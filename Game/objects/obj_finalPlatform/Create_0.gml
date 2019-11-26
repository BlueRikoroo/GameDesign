/// @description 
// 

// Inherit the parent event
event_inherited();

Horizontal_Platform = false
dir = -1
vertical_speed = 0
y_position_from = 0
y_position_to = 1000000

activated = false

ps = part_system_create()

pe = part_emitter_create(ps)

pt = part_type_create()
part_type_color2(pt, c_yellow, c_white)
part_type_shape(pt,pt_shape_line)
part_type_scale(pt,1,3)
part_type_size(pt,0.25,1,-0.1,0)
part_type_life(pt,10,30)
part_type_speed(pt,2,5,0,0)
part_type_direction(pt,270,270,0,0)
part_type_alpha3(pt, 1, 0.75, 0)
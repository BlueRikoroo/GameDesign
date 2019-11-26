#region Draw Rope

draw_set_color(merge_color(c_green,c_red,min(1,length/maxLength)))
draw_line_width(x1,y1,x2,y2,3)

#endregion

surface_set_target(surf)
part_system_drawit(ps)
surface_reset_target()

var dir = point_direction(x1,y1,x2,y2)+90
var rad = degtorad(dir)
var scale = length/300
draw_surface_ext(surf, x1-20*cos(rad), y1+20*sin(rad),1,scale,dir,-1,1)
dir += 180
rad = degtorad(dir)
draw_surface_ext(surf, x2-20*cos(rad), y2+20*sin(rad),1,scale,dir,-1,1)
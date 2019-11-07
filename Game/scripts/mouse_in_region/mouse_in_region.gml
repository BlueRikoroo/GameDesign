/// @description mouse_in_region(x1,y1,x2,y2)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/*Old code
if mouse_x >= argument0 and mouse_x <= argument2 and mouse_y >= argument1 and mouse_y <= argument3{return true}
else {return false;}
*/
if (point_in_rectangle(mouse_x, mouse_y, argument0, argument1, argument2, argument3)) {
    return true;
} else {
    return false;
}

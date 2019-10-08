/// @description Spawns a crate in the map
/// @param x
/// @param y

// Returns [crate]
var obj1 = instance_create_layer(argument0, argument1, get_layer_depth(0), obj_crate)
obj1.collision_type = 0
obj1.image_xscale = 2
obj1.image_yscale = 2

return [obj1]
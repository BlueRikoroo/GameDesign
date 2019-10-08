/// @description Returns a layer based on the depth you want to use
/// @param depth

if ds_map_exists(global.layerMap,argument0)
	return ds_map_find_value(global.layerMap,argument0)
else{
	var l = layer_create(argument0)
	ds_map_add(global.layerMap,argument0,l)
	return l
}


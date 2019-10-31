//instance_deactivate_object(obj_crate);
instance_destroy();
if (instance_number(obj_player) < 1)
{
	global.deaths += 1;
	room_restart();
}
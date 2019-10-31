
instance_destroy();
if (instance_number(obj_player) < 1)
{
	global.deaths += 1;
	spawn_players(100,700,350);
}
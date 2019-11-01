
if(Horizontal_Platform = true)
{
	x += horizontal_speed * dir;

	if( x <= x_position_from || x >= x_position_to)
	{
		dir *= -1;
	}
}
else
{
	y += vertical_speed * dir;

	if( y <= y_position_from ||  y = y_position_to)
	{
		dir *= -1;
	}	
}
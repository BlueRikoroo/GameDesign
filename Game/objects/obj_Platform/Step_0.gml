horizontal_collision(obj_player);
vertical_collision(obj_player);

if(pWait = false)
{
	if(Horizontal_Platform = true)
	{
		x += horizontal_speed * dir;

		if( x < x_position_from || x > x_position_to)
		{
			dir *= -1;
		}
	}
	else
	{
		y += vertical_speed * dir;

		if( y < y_position_from ||  y > y_position_to)
		{
			dir *= -1;
		}	
	}
	
}

else if(place_meeting(x,y-1 ,obj_player))
	{
		pWait = false
	}
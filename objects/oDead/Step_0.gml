/// @description Collision
// You can write your code in this editor
if (done ==0)
	{
		vsp = vsp + grv;

	//Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}


	//Vertical Collision
	if (place_meeting(x,y +vsp,oWall))
	{
		if(vsp > 0) 
		{
			done = 1;
			image_index = 1;
		}
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
		y += vsp;
		x += hsp;
	}
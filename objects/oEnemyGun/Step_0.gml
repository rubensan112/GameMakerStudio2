/// @desc Collisions

vsp = vsp + grv;

//Vertical Collision oWallSmall
if (place_meeting(x,y +vsp,oWallSmall))
{
	while (!place_meeting(x,y+sign(vsp),oWallSmall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//Horizontal Collision oWallSmall
if (place_meeting(x+hsp,y,oWallSmall))
{
	while (!place_meeting(x+sign(hsp),y,oWallSmall))
	{
		x += sign(hsp);
	}
	hsp = -hsp;

	
}
x += hsp;
 
//Vertical Collision oWall
if (place_meeting(x,y +vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//Horizontal Collision oWall
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = -hsp;

	
}
x += hsp;

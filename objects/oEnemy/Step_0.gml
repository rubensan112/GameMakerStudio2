/// @desc Collision Hor/Ver and Animations


//Calculate Movement
//var move = key_right - key_left;

//hsp = move * walksp;
vsp = vsp + grv;
var jump_at_distance = hsp*14*(5*scale)/(3*scale);
//Jump Mode
if (jump)
	{
	if (place_meeting(x+jump_at_distance,y,oWall)) 
	{	
		if (disable_jump >= 0) 
		{
			key_jump = true;
		}
	}

	disable_jump += 1/global.frames;

	if (place_meeting(x,y+1,oWall)) && (key_jump) && (disable_jump >= 0)
	{
		vsp = -jump_force;
		key_jump = false;
		disable_jump = -1;
	}
}
//Quiet mode
if (quiet)
{
hsp = 0;
}
//Jump quiet mode
if (jump_quiet)
{
hsp = 0;
	if (place_meeting(x,y+1,oWall)) 
		{
			vsp = -jump_quiet_jump;
		}
}
//Crazy Jump
if (jump_crazy)
{
	if (place_meeting(x,y+1,oWall)) 
		{
			vsp = -jump_jump_crazy +random_range(-1,1);
		}
}

//Chase mode

if (chase)
{
	with(oPlayer)
	{
		if (other.triger >= 1)
			{
				if (other.triger_disable <= 0) 
				{ 
				if ((x-other.x) > 0) && ((abs(y-other.y)) <= other.triger_distance_y)
				{
					other.hsp = other.walksp;
					other.triger_disable = 1;
				}
				if ((x-other.x) < 0) && ((abs(y-other.y)) <= other.triger_distance_y)
				{
					other.hsp = -other.walksp;
					other.triger_disable = 1;
				}
				
			}
			else
			{
				other.triger_disable -= 0.1;
			}
			}
		else
		{
			other.hsp = 0;
			if ((abs(x-other.x)) <= other.triger_distance_x)  && ((abs(y-other.y)) <= other.triger_distance_y) other.triger = 1;
		}
	}
	
}
//Scape mode
if (escape)
{
with(oPlayer)
	{
		if (other.triger >= 1)
			{
				if (other.triger_disable <= 0) 
				{
				if ((abs(x-other.x)) <= other.triger_distance_x) && ((abs(y-other.y)) <= other.triger_distance_y)
				{
					other.hsp = -other.walksp*sign(x-other.x);
					other.triger_disable = 1;
				}
				else
				{
					other.hsp = 0;
					other.triger_disable = 1;
				}
				
			}
			else
			{
				if other.hp <= 3
				{
					other.escape = false;
					other.chase = true;
				}
				other.triger_disable -= 0.05;
			}
			}
		else
		{
			other.hsp = 0;
			if ((abs(x-other.x)) <= other.triger_distance_x) && ((abs(y-other.y)) <= other.triger_distance_y) other.triger = 1;
		}
	}
	
}
//Modo sin caerse de baldosas
if (dont_fall)
{
	if (!place_meeting(x+hsp,y+vsp,oWall)) 
		{
			hsp = -hsp;
		}
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = -hsp;

	
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y +vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;



//Animations
if(!place_meeting(x,y+1,oWall)) //Poco eficiente, misma condicion 2 veces
{
	sprite_index = sEnemyJ;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0;
	
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemy;
	}
	else
	{
		sprite_index = sEnemyR;
	}
}

if (hsp !=0) image_xscale = sign(hsp)*scale;







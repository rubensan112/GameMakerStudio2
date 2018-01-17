/// @description Create Boss

if (!deactivate)
{
	// Create Boss
	with (instance_create_layer(700,200,"Enemy", oEnemy))
		{
			jump = true;
			quiet = false;
			jump_quiet = false;
			dont_fall = false;
			jump_crazy = false;
			chase = true;
			escape = false;
			//Combinaciones: jump + chase/escape, dont fall + chase/escape meh, jump_crazy + chase/escape.
			//Estadisticas
			walksp = 3; 
			hsp = walksp;
			//hsp = -walksp; Go to other direction at beggining
			scale = 8;
			hp = 300;
			enemyPower = 2;
			jump_quiet_jump = 12;
			jump_jump_crazy = 4;
			triger_distance_x = 600;
			triger_distance_y = 300;
			image_yscale = scale;
			image_xscale = scale;
			jump_force = 16;
			sun_atack = true;
		}
}
//Deactivate trigger
deactivate = true;
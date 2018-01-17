/// @desc Movement, Animations

/// Get Player Input
	//Quit Game
	if keyboard_check_direct(vk_escape)
	{
		game_end();
	}
	//Movement
	if (hascontrol)
	{
		key_right = keyboard_check(ord("D"));
		key_left = keyboard_check(ord("A"));
		key_jump = keyboard_check_pressed(vk_space); //Si mantienes pulsado, la primera vez devuelve 1, las siguientes veces, 0, hasta que dejes de pulsarlo.
		key_jump_held = keyboard_check(vk_space);

		if (key_left) || (key_right) || (key_jump) || (mouse_check_button(mb_left))
			{
				controller = 0;	
			}
		if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2) ////primer numero creo que device_slot
			{

			key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
			key_right = max(gamepad_axis_value(0, gp_axislh), 0);
			controller = 1;
			}

		if (gamepad_button_check_pressed(0, gp_face1))
			{
				controller = 1;
				key_jump = 1;

			} 
	}
	else 
		{
			key_right = 0;
			key_left = 0;
			key_jump = 0;
		}

/// Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

/// Vertical Collision
if (place_meeting(x,y +vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
/// Vertical Collision
if (place_meeting(x,y +vsp,oWallMove))
{
	//To avoid move for every instance of owallMove that collide. Only move one time for every frame, no matter how many collide.
	stopWallMove = false;
	while (!place_meeting(x,y+sign(vsp),oWallMove))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

/// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
/// Horizontal Collision
if (place_meeting(x+hsp,y,oWallMove))
{
	while (!place_meeting(x+sign(hsp),y,oWallMove))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;


/// Jump
if ((place_meeting(x,y+1,oWall)) || (place_meeting(x,y+1,oWallMove))) && (key_jump)
{
	//Number of jumps reset when touch ground
	jumps = jumpsmax;
}
else
{
	//Disable more jumps
	if (jumps == jumpsmax) jumps -= 1;
}
//jump
if (key_jump) && (jumps > 0)
{
	vsp = - jumpHeight;
	//One jump less
	jumps -= 1;
}
//Variable Jump
if (vsp < 0 ) && (!key_jump_held) vsp = max(vsp,(-jumpHeight/2));


// Futuro: var hsp_final = hsp +hsp_carry;
/// Animations (Poco ampliable ahora mismo. Mejorar sistema)
if (!atack) && (!dash)
{
	if (!place_meeting(x,y+1,oWall)) &&  (!place_meeting(x,y+1,oWallMove)) //Poco eficiente, misma condicion 2 veces
	{
		//Jumping
		sprite_index = sPlayerJ;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1;	else image_index = 0;
	
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{	//Normal
			sprite_index = sPlayer;
		}
		else
		{
			//Running
			sprite_index = sPlayerR;
		}
	}
}
	//Turn
	if (hsp !=0) image_xscale = sign(hsp);

	//Dead
	if (hp <= 0)
	{
		sprite_index = sPlayerD;
		hascontrol = false;
		if (dead_countdown == 0) 
		{	
			ScreenShake(30,100);
			image_speed = 0;
			lose = true;
		}
		
		if (dead_countdown >= time_to_fall/3) 
		{	
			if (dead_countdown >= time_to_fall)
			{
				image_index = 2;
			}
			else
			{
				image_index = 1;
			}
		}
		
		if (dead_countdown >= dead_time) 
		{
			SlideTransition(TRANS_MODE.RESTART);
		}
		dead_countdown += 1/global.frames;
	}

/// Special movements

/// Dash

//Disable dash for cooldown.
if (keyboard_check_pressed(ord("I"))) && (!disable_dash)
{
	dash = true;
	dash_velocity_0 = 0; //Initial velocity, not implemented now
	x_0 = x; //Initial x in dash movement.
	
	//Choose accelaration in direction of facing
	if (image_xscale == -1)
		{
			acceleration = -acceleration_master;
		}
	else
		{
			acceleration = acceleration_master;
		}

}
if (dash) //Bastante cutre. //Ademas queda poner invulnerabilidad
{	
	//Disable gravity in dash
	//grv= 0;
	//vsp = 0;
	
	//Var time in the formula
	timeDash += 0.05;
	
	//Check if player is not atacking to priorizate Atack Animation.
	if (sprite_index != sPlayerAtack)
		{
			sprite_index = sPlayerR;
			image_index = 2;
			image_speed = 0;
		}
		
	if (sign(acceleration) < 0)
		{
			//Decrease x step at step, follow MRUA
			x_to_avance = max(-dash_lenght + x_0 , x_0 + (dash_velocity_0*timeDash) + ((acceleration*timeDash*timeDash)));
		}
		
	else
		{
			//Increase x step at step, follow MRUA
			x_to_avance = min(dash_lenght + x_0 , x_0 + (dash_velocity_0*timeDash) + ((acceleration*timeDash*timeDash)));
		}
		
	//Check if next x is in collision
	if (place_meeting(x_to_avance, y,oWall))
		{
			//Aumenta o reduce x, para que no collisione.
			while(!place_meeting(x+sign(acceleration), y,oWall))
			{
				x += sign(acceleration);
			}
			//Para el flash.
			dash = false;
			//Reinicia el tiempo.
			timeDash = 0;
			//Enable gravity after dash
			//grv = 0.4;
			//vsp = 0;
		}
	else
		{
			x =  x_to_avance;
		}
	
	//Check if dash lenght is reached, in every direction
	if ((x_0 +dash_lenght <= x) && (sign(acceleration) > 0)) || ((x_0 -dash_lenght >= x) && (sign(acceleration) < 0))
		{
			dash = false;
			timeDash = 0;
			vsp = 0;
			disable_dash = true;
		}
}

//If flash is finished, decrease the timer.
if (disable_dash) dash_cooldown_ -= (delta_time/(1000000));

	if (dash_cooldown_ < 0)
		{	
			//Restart cooldown, and enable flash
			dash_cooldown_ = dash_cooldown;
			disable_dash = false;
		}
	

/// Atack Melee

if (keyboard_check_pressed(ord("J")))
{
	atack = true;
	//disable_atack = false;
	//Starts Animation Atack
	image_index = 0;
	sprite_index = sPlayerAtack;
	image_speed = 1;
}
if (atack)
{
	//Numbers of atack in each animation
	//Segun la velocidad elegida de la animacion, 60 seria un image_index en cada frame, a 30 cada 2.
	//Se saltaria el image_index = 3
	//30 frames/segundo pero son 5 frames.
	if (image_index >= 1) && (image_index <= 4) //Como pongo  30 frames/segundo la animacion
	{
		//Create Hitbox instance
		with(instance_create_layer(x,y,"Gun",oSword1))
		{
			//Turn hitbox at same as player
			image_xscale  = other.image_xscale;
			meleeDamage = other.meleeDamage;
			//if (other.disable_atack == false)
			//{
				//Check for every oEnemy in collision
				var list, length = 0;
				var result, n = 0;
				var cid;

				while true {
				    cid = instance_place(x, y, oEnemy);
				    if cid {
				        result[n++] = cid;
				        instance_deactivate_object(cid);
				    } else
				        break;
				}
				//Iter for any enemy
				for(var i = 0; i < n; i++)
				{
				    instance_activate_object(result[i]);
					with(result[i])
						{
							//oEnemy change state
							ScreenShake(10,20);
							flash += 1.5/4;
							vsp = (-3)/4;
							hp -= ((other.meleeDamage)/4) - ((other.meleeDamage)/4)/4// Bastante aproximado a la realidad.
							hsp = sign(x-other.x) *4;
							image_xscale = sign(hsp);
						}
				}
			//To disable creating more than one hitbox in atack.
			//if (instance_place(x,y,oEnemy)) other.disable_atack = true;
			//}
		}
	}
	//Finish atack
	if (image_index = 4)
	{
		atack = false;
		sprite_index = sPlayer;
	}
}
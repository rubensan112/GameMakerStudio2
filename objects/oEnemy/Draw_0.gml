/// @description White Shader being hit and Sun atack.

draw_self();


if (flash) >= 0
{
	flash--;
	shader_set(shWhite); //All colour ignore, only white
	draw_self();
	shader_reset();
}

/// Sun Atack
if(sun_atack == true)
{
	if (countdown) sun_atack_countdown += (delta_time/(1000000));
	if (sun_atack_countdown > 1)
	{
		countdown = false;
		sun_atack_countdown = 0;
		sun_atack_countdown_reverse = 0;
	}
	with(oPlayer)
	{
		if (abs((x-other.x)) < 100) 
		{
			other.countdown = true;
		}
		if (other.sun_atack_countdown >= 0.4) && (other.sun_atack_countdown_reverse <= 1)
			{
				other.sun_atack_countdown_reverse += 0.05;
				draw_sprite_tiled(sSunAtack,8,(other.x)-(other.gui_width*0.5),other.y);
				ScreenShake(30,80)
				if (abs((x-other.x)) < 100)
				{
				hp -= (other.enemyPower*10)/global.frames;
				flash += flash_collision/global.frames;
				}
			}
	}
	
}

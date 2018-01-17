/// @desc Other

//Sun Atack
if(sun_atack == true)
{
	//real_time += delta_time/(1000000);
	if (time > 0.8)
	{
		time = 0;
		sun_atack_countdown = 0;
		sun_atack_countdown_reverse = 0;
	}
	with(oPlayer)
	{
		if (abs((x-other.x)) < 100) 
		{
			other.sun_atack_countdown +=0.04;// && (other.y > y)
			other.time += (delta_time/(1000000))
			if (other.sun_atack_countdown >= 1)
				{
					other.sun_atack_countdown_reverse += 0.2;
					draw_sprite_tiled(sSunAtack,8,(other.x)-(other.gui_width*0.5),other.y);
					ScreenShake(10,40)
					hp -= (other.enemyPower*10)/global.frames;
					flash += flash_collision/global.frames;
					if (other.sun_atack_countdown_reverse >= 1) 
					{
						other.sun_atack_countdown = 0;
						other.sun_atack_countdown_reverse = 0;
					}
					
				}
		}
	}
	
}
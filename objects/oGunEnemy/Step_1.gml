/// @description Position of Gun / Angle image / Shoot / Recoil

/// Position of Gun with particular enemy
if (!instance_exists(enemyId)) instance_destroy();
with (enemyId)
{
	other.x = x;
	other.y = y;
}

/// Get angle of shooting
image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}

/// Shoot
firingdelay -= 1;
recoil = max(0, recoil -1);

if  (firingdelay < 0)
{
	recoil = 4;
	firingdelay = firingdelay_max;
	ScreenShake(0.5,3);
	with (instance_create_layer(x,y,"Bullet", oBulletEnemy))
	{
		speed = other.bullet_speed;
		bullet_damage = other.bullet_damage;
		direction = other.image_angle + random_range(-3,3); //Con other, nos referimos al original, en este caso la instanci de oGun.
		image_angle = direction;
	}
}

/// Recoil
x -= lengthdir_x(recoil, image_angle)//Funcion compleja, determina la cantidad de x que debe moverse
//Segun la distancia que une el punto de partida y el final, y el angulo
y -= lengthdir_y(recoil, image_angle)

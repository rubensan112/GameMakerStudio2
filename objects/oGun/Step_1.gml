/// @description Shoot / Gun animations / Gun Position
// Los begin step, ocurriran antes que cualquier step event.
//Asi conseguimos que la pistola siempre vaya por detras nuestra.

//Position of Gun
x = oPlayer.x + 6;
y = oPlayer.y ;
/// Get angle of shooting
var controllerh = 0;
var controllerv = 0;

if (oPlayer.controller == 0)
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	controllerh = gamepad_axis_value(0,gp_axisrh)
	controllerv = gamepad_axis_value(0,gp_axisrv)
	
	if (abs(controllerh) >0.1) || (abs(controllerv) > 0.1)
	{
		controllerangle = point_direction(0,0, controllerh, controllerv)
	}
	image_angle = controllerangle;
}

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

if ((mouse_check_button(mb_left))  ||  abs(controllerh) >0.1 || abs(controllerv) > 0.1) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay = global.firingdelay;
	ScreenShake(2,10);
	with (instance_create_layer(x,y,"Bullet", oBullet))
	{
		speed = 25;
		direction = other.image_angle + random_range(-3,3); //Con other, nos referimos al original, en este caso la instanci de oGun.
		image_angle = direction;
	}
}

/// Recoil
x -= lengthdir_x(recoil, image_angle)//Funcion compleja, determina la cantidad de x que debe moverse
//Segun la distancia que une el punto de partida y el final, y el angulo
y -= lengthdir_y(recoil, image_angle)
//Calculo de x, e y, con la hipotenusa de un triangulo, y el angulo.

/// @desc Dead
if (hp <=0)
{
	with(instance_create_layer(x,y,layer,oDeadGun))
	{
		shake_scale = other.scale;
		direction = other.hitfrom;
		hsp = lengthdir_x(3, direction) //Para mover a un punto determinado que no sabemos donde esta
		vsp = lengthdir_y(3, direction)-2 //Sabemos la distancia de punto a punto y el angulo
		//Nos devuelve, los catetos del triangulo, dado un angulo, y la hipotenusa
		if (sign(hsp) != 0) image_xscale = sign(hsp)*other.scale;
		image_yscale = other.scale;
	}
	
	instance_destroy();
}
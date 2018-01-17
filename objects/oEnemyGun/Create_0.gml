/// @desc Gravity and Generate Gun

/// Stats
hp = 4;
scale = 1;
bullet_speed = 14;
firingdelay_max = 14;
bullet_damage = 1/4;


/// Movement
vsp = 0;
grv = 0.3;
hsp = 0;


x_origin = x;

//Init vars
hitfrom = 0;
//Flash
flash = 0; 
flash_bullet = 60; //Flash of oEnemyGun being shot.
flash_collision = 20; //Mayor valor, mayor duracion/segundo el flash intermitente.

/// Generate Gun
with (instance_create_layer(x,y,"Bullet",oGunEnemy))
{
	enemyId = other.id;
	bullet_speed = other.bullet_speed;
	firingdelay_max = other.firingdelay_max;
	bullet_damage = other.bullet_damage;
}


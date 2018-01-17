/// @desc Destroy bullet and reduces hp of oPlayer

with (other)
{
	hp -= other.bullet_damage;
	if (flash <= 1) flash += flash_bullet/global.frames;
}

instance_destroy();
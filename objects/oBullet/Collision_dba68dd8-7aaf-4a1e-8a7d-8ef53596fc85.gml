/// @description Destroy bullet and give direction hit to oEnemyGun.

with (other)
{
	hp--;
	hitfrom = other.direction;
	if (flash <= 1) flash += flash_bullet/global.frames;
}

instance_destroy();
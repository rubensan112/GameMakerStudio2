/// @description Destroy bullet and give direction hit to oEnemy.

with (other)
{
	hp--; // Si es solo una --, o ++
	hitfrom = other.direction;
	if (flash <= 1) flash += flash_bullet/global.frames; //Si no fuese asi, cada disparo simplemente sumaria tiempo del flash, indefinidamente. El objecto seria mucho tiempo blanco.
}

instance_destroy();
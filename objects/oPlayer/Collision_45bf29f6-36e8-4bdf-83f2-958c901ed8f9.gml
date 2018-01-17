/// @description Collision with Enemy

with (other)
{
	hp -= (other.playerPower*10)/global.frames;
	other.hp -= (enemyPower*10)/global.frames;
	// Creo que el flash se puede quedar asi.
	flash += flash_collision/global.frames;
	other.flash += 20/global.frames;
	hitfrom = other.direction;
}


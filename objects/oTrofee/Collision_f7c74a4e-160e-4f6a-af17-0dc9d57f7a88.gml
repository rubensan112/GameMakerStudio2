/// @description Conditions to win.

if (!instance_exists(oEnemyGun)) && ((!instance_exists(oEnemy)))
{
	win = true;

with (oPlayer) 
{
	if (hascontrol)
	{
		hascontrol = false;
	}
}
}

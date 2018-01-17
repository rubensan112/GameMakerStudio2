/// @desc Flash when is damaged

draw_self();

if (flash) >= 0
{
	flash--;
	shader_set(shWhite); //All colour ignore, only white
	draw_self();
	shader_reset();
}
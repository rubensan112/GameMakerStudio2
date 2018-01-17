/// @description White Shader being hit.

draw_self();

if (flash) >= 0
//Creo que nada mas empezar ocurre. Solo que es de tan poca duracion, que no se ve.
//Es decir, cuando realmente empieza la partida, vale -1.
{
	flash--;
	shader_set(shWhite); //All colour ignore, only white
	draw_self();
	shader_reset();
}

//draw_text(200,200,string(dash));
//draw_text(200,300,string(atack));
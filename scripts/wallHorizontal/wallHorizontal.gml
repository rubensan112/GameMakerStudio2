/// @desc wallHorizontal(lenght_move, wallSpeed)
/// @arg lenght_move
/// @arg wallSpeed

if ((abs(x - x_0)) > lenght_move) || (x == x_0) wallSpeed = -wallSpeed;
x += wallSpeed;

with(oPlayer)
{
	if (!stopWallMove)
	{
	if place_meeting(x, y+30, oWallMove)
		{
			var inst;
			inst = instance_place(x, y+30, oWallMove);
			with(inst)
			{
				other.x += wallSpeed;
				other.stopWallMove = true;
			}
		}
	}
}

//El place_meeting lo que realmente hace es trasladar al jugador al punto designado, y chequear si las collision mask, se tocan entre ellas.
//Por eso, aqui hace collision con mas de 1, y por lo tanto aumenta x mas de una vez por frame. (Tantas como collisione)


//Cuando pones varios oWallMove con diferentes velocidades, o lengh_move, como que no hace caso. Es decir la isntancia que llama con el with, y con el 
//que choca deben ser diferentes.

//Utiliza la wallSpeed de la primera instancia que se coloca.
//Tiene sentido, porque cuando se ejecuta la primera instancia que he puesto... cumple el place_meeting, ya este en el bloque 1 o 2. Y me mueve con
//esa velocidad.
/// @description Move to next room
// Especificar target= 'room name' en el creation_code de la instancia. En la room.
with (oPlayer)
{
	if (hascontrol)
	{
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,other.target);
	}
}
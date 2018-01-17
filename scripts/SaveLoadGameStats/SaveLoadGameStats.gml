/// @desc SaveLoadGame(mode, keygroup, key, varToSave)
/// @arg Mode
/// @arg keygroup
/// @arg key
/// @arg varToSave

/// Nota
// Si encuentra ya el campo, simplemente, sobrescribe.

modeSaveGame = argument0;
keygroup = argument[1];
key = argument[2];
varToSave = argument[3];

if (modeSaveGame == "Save")
{
	var file;
	file = ini_open(SAVEFILE);
	ini_write_real(keygroup,key,varToSave);
	ini_close();
}

if (modeSaveGame == "Load")
{
		//Load Save
		with(oPlayer)
			{
			other.xcheck = ini_read_real("RoomState","xPlayer",x);
			if (other.xcheck != x) //If position is diferent move the player, and deactivate trigger.
				{
				x = other.xcheck;
				y = ini_read_real("RoomState","yPlayer",y);
				other.triggerActivated = false;
				}
			}
}
/// @desc SaveLoadGame(mode)
/// @arg Mode

modeSaveGame = argument0;
if (modeSaveGame == "Save")
{
//Overwrite old save.
		//if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create new save
		var file;
		file = ini_open(SAVEFILE);
		ini_write_real("RoomState","room",room);
		ini_write_real("RoomState","idTrigger",id);
		with(oPlayer) 
		{
			ini_write_real("RoomState","xPlayer",x);
			ini_write_real("RoomState","yPlayer",y);
		}
		
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
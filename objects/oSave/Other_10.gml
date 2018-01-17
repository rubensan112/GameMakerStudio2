/// @desc Load the save from the right trigger, before anything, and disable it.
/// For this reason, it is here, it will execute all instances, in the instance with number = 0;
///Nothing will hapen before the room start of instance with number = 0.

/// Loop through  all instances
for (var i = instance_number(oSave)+1; i >= 0; i --;)
	{
		/// Save instances in array, to call later.
		saves[i] = instance_find(oSave,i);
		with(saves[i])
			{
				var file;
				file = ini_open(SAVEFILE);
				/// Check if the save have the id of trigger.
				if (ini_read_real("RoomState","idTrigger",0) == id) && (triggerActivated)
				{
					SaveLoadGame("Load");
				}
			ini_close();
		}
	   
	}

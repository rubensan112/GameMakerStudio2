/// @desc Execute Autosave

/// Loop through  all instances
for (var i = instance_number(oSave)+1; i >= 0; i --;)
	{
		/// Save instances in array, to call later.
		saves[i] = instance_find(oSave,i);
		with(saves[i])
			{
				var file;
				file = ini_open(SAVEFILE);
				/// AutoSave Mode (Dont need to be a collision to save)
				if (autoSaveRoom) && (!trigerMode)
					{
						SaveLoadGame("Save");
						autoSaveRoom = false;
					}
			ini_close();
		}
	   
	}

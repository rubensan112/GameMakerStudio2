/// @desc Execute the right save

///Disable olders triggers and autosaves triggers.
//No matter the orders of triggers calling room start.

/// This code only will execute one time for room.
if (number == 0)
{
	/// Excute the right load (only triggers) and disable it. (trigerActivated = false)
	event_user(0);
	
	/// Disable also olders triggers, and autosaves.
	var file;
	file = ini_open(SAVEFILE);
	for (var i = instance_number(oSave)+1; i >= 0; i --;)
		{
		  saves[i] = instance_find(oSave,i);
		  with(saves[i])
			  {
				//Get the number of last trigger.
				if (triggerActivated = false) && (trigerMode == true) other.bigger_number = number;
			  }
		 }
	  
	  for (var i = instance_number(oSave)+1; i >= 0; i --;)
		  {
		  with(saves[i])
			  {
				  //Disable all oSaves with numbers more lowers than actual.
				  if (other.bigger_number > number) 
				  {
					  triggerActivated = false;
					  autoSaveRoom = false;
				  }
			  }
		  }
		  
	/// Now if a number of Autosave is older, it is disabled, now we can check if there is a Autosave that not has been disabled. Then Save game.
	event_user(1);

}
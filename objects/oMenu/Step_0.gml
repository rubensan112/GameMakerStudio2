/// @des Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (gamepad_button_check_pressed(0,gp_padu))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items -1;
	}
	if (gamepad_button_check_pressed(0,gp_padd))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items -1;
	}
	if (keyboard_check_pressed(ord("Q")))
	{
		menu_x_target= gui_width + 200;
		menu_commited = menu_cursor;
		ScreenShake(2,15);
		menu_control = false;
	}
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		menu_x_target= gui_width + 200;
		menu_commited = menu_cursor;
		ScreenShake(2,15);
		menu_control = false;
	}
}
if (menu_x >gui_width +150) && (menu_commited != -1)
{
	switch(menu_commited)
	{
		//case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
		case 2: 
		{
			SlideTransition(TRANS_MODE.GOTO,rDialoge); 
			if (file_exists(SAVEFILE))	file_delete(SAVEFILE);
			break;
		}
		case 1: 
		{
		if (!file_exists(SAVEFILE))	
		{
			SlideTransition(TRANS_MODE.GOTO,rMenuStart);
		}
		else
			{
				var file;
				file = ini_open(SAVEFILE);
				var target = ini_read_real("RoomState","room",0);
				ini_close();
				SlideTransition(TRANS_MODE.GOTO,target);
		
			}	
		}
		break;
		case 0: game_end(); break;
		
	}
}
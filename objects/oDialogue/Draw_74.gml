/// @desc ?
/// @desc ?
/// @desc Draw

restart = false;

if (keyboard_check_pressed(ord("Q")))
{
	restart = true;
	if (chooseTxt == (list_length-1))
	{
		SlideTransition(TRANS_MODE.GOTO,rOneV2);
		restart = false;
	}
	if (chooseTxt != (list_length-1)) chooseTxt += 1;
}

//El orden importa
txt[chooseTxt] = ds_map_find_value(txtDialogue, chooseTxt)
//draw_text(200,200,txt[chooseTxt]);
draw_sprite(sImagePlayer,1,-30,y1_box);
NineSliceBox_stretch(s9Slice,margin/2 ,y1_box ,gui_width- margin/2 ,gui_height - (margin + 10));
draw_text_speed(margin/2 + margin_string, y1_box + margin_string, txt[chooseTxt], txt_speed,restart)


//Quitar el script de draw text?, y configurar todo para que sea util de verdad.

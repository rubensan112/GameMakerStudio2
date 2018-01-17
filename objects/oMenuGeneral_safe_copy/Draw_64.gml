/// @des Draw HUD

if (fps_check < 1)
{
/// Block 0	
 var block = 0;
	// Element 0, FPS
		hud_var[block, 1] = fps;
		hud_var[block, 0] = fps;

for (var b = 0; b < hud_blocks; b++)
{
	for (var i = 0; i < hud_items_block[b]; i++)
	{
		var txt = hud_text[b,i];
		//Modificator 
		if (string_count("0",txt) >= 1)
		{
			//txt = string_delete(txt, index, count);
			last_position = string_length(txt) + 1;
			position_first_zero = last_position - string_length(string(hud_var[b, i]))
			txt = string_delete(txt, position_first_zero , string_length(string(hud_var[b, i])));
			txt = string_insert(string(hud_var[b, i]), txt, last_position) //0 in the start of the string
			var col = c_white;
		}
		else
		{
			var col = c_gray;
		}
		//Mode
		if (hud_horizontal[b] == true)
		{
		
			var xx = hud_x[b] - (hud_width_lasts_words[b,i]);

		}
		else
		{
			var xx = hud_x[b];
		}
		if (hud_vertical[b] == true)
		{
			var yy = hud_y[b] - (hud_height_lasts_words[b,i]);
		}
		else
		{
			var yy = hud_y[b]
		}
		draw_set_halign(halign[b]);
		draw_set_valign(valign[b]);
		draw_set_font(hud_font[b])
		//Sombra blanca
		var offset = 2;
		draw_set_color(c_black);
		draw_text(xx-offset,yy,txt); //Borde negro
		draw_text(xx+offset,yy,txt);
		draw_text(xx,yy+offset,txt);
		draw_text(xx,yy-offset,txt);
		//Drawn text
		draw_set_color(col);
		draw_text(xx,yy,txt);
	}
}
	fps_check += 0.01;
}
else
{
	fps_check -= 1;
}
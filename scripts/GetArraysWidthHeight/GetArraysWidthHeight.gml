/// @desc GetArraysWidthHeight(block, font)
/// @arg Block chose block
/// @arg Font
/// Los scripts tienen las mismas variables que el objecto desde donde se llaman, excepto las variables temporales.
block = argument[0];
font = argument[1];
draw_set_font(font)
for (var m = 0; m < hud_items_block[block]; m++)
	{
		if (m ==0)
		{
			hud_width_lasts_words[block,m] = 0;
		}
		else
		{
			hud_width_lasts_words[block,m] = hud_width[block,m-1]
		}
		hud_width[block,m] = hud_width_lasts_words[block,m] + string_width(hud_text[block,m]) + margin_horizontal;
		//if (max_length[block] < string_width(hud_text[block,m])) max_length[block] = string_width(hud_text[block,m]);
		
	}
		for (var m = 0; m < hud_items_block[block]; m++)
	{
		if (m ==0)
		{
			hud_height_lasts_words[block,m] = 0;
		}
		else
		{
			hud_height_lasts_words[block,m] = hud_height[block,m-1]
		}
		hud_height[block,m] = hud_height_lasts_words[block,m] + string_height(hud_text[block,m]) + margin_vertical;
	}
	
return m
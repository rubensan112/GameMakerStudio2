/// @desc Draw Menu

///9Slicebox



draw_set_font(fMenu);
draw_set_halign(fa_right); //Alineamiento del texto horizontal
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0) //0 in the start of the string
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i*1.6)); //Esto es para separar cada uno de los menus verticalmente.
	//Sombra blanca
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt); //Borde negro
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt);
	//Drawn text
	draw_set_color(col);
	draw_text(xx,yy,txt);
}
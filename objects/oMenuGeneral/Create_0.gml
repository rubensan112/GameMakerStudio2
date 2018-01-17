/// @desc Draw Menu Text

fps_check = 80;
gui_width = display_get_gui_width(); //Es toda la camara (width)
gui_height = display_get_gui_height();
margin_horizontal = 10;
margin_vertical = 40;
gui_margin_horizontal = 32;
gui_margin_vertical = 20;
fps_downrate = 6;


// Definition
var block = 0;
var m =0;



/// Block 0	
block = 0;
	// Element 0, FPS
		hud_text[block, 5] = "R to back to Menu";
		hud_text[block, 4] = "Space to jump / double jump";
		hud_text[block, 3] = "ASWD to move";
		hud_text[block, 2] = "J to atack";
		hud_text[block, 1] = "I to dash";
		hud_text[block, 0] = "Q Enter /advance to next dialogue";
	// Finish Element 0
	hud_vertical[block] = true;
	hud_horizontal[block] = false;
	hud_font[block] = fDialogue;
	var_text[block,0] = 0;
	hud_color[block] = c_white;
	hud_items_block[block] = array_length_2d(hud_text, block);
	m = GetArraysWidthHeight(block,hud_font[block]);
			hud_x[block] = (gui_width * 0.5);
			halign[block] = fa_middle;
			hud_y[block] = (gui_height * 0.5) + hud_height[block,m-1]/2 - hud_height[block,0]/2;
			valign[block] = fa_center;
/// Finish Block 0

hud_blocks = array_height_2d(hud_text); //Con este vemos cuantos arrays hay en 

//Importante, el punto desde donde empieza a dibujar es el punto de abajo del texto.


//La x definimos el punto, donde no habra nada por la derecha
//La y definimos el punto, donde no habra nada por arriba.
//Todo se mide, con la esquina del texto de abajo derecha. (Esta el allign asi)




///


















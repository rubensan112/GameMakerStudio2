/// @desc Draw Menu Text

fps_check = 0;
gui_width = display_get_gui_width(); //Es toda la camara (width)
gui_height = display_get_gui_height();
margin_horizontal = 10;
margin_vertical = 10;
gui_margin_horizontal = 32;
gui_margin_vertical = 20;

// Definition
var block = 0;
var m =0;


/// Block 1
block = 1;
	// Elements //array[numero de filas, numero de columnas] array[1,2] fila 1, columna 2. lenght mira lo mismo
		hud_text[block, 0] = "Hi";
	// Block Properities
	hud_vertical[block] = true;
	hud_horizontal[block] = false; 
	hud_font[block] = fMenu;
	// Dont touch
	hud_items_block[block] = array_length_2d(hud_text,block); //Miramos la longitud del array
	m = GetArraysWidthHeight(block,hud_font[block])
	hud_x[block] = gui_width - gui_margin_horizontal;
	halign[block] = fa_right;
	hud_y[block] = gui_height - gui_margin_vertical;
	valign[block] = fa_bottom;
/// Finish Block 1

/// Block 0	
block = 0;
	// Element 0, FPS
		hud_text[block, 1] = "FPS 00"; //Para que mida bien el tamaño
		hud_text[block, 0] = "FPS REAL: 00";
	// Finish Element 0
	hud_vertical[block] = false;
	hud_horizontal[block] = true;
	hud_font[block] = fMenu;
	var_text[block,0] = 0;
	hud_items_block[block] = array_length_2d(hud_text, block);
	m = GetArraysWidthHeight(block,hud_font[block]);
	hud_x[block] = hud_width[block,m-1] - margin_horizontal + gui_margin_horizontal;
	halign[block] = fa_right;
	hud_y[block] = hud_height[block,0] + gui_margin_vertical - margin_vertical;
	valign[block] = fa_bottom;
/// Finish Block 0

hud_blocks = array_height_2d(hud_text); //Con este vemos cuantos arrays hay en 

//Importante, el punto desde donde empieza a dibujar es el punto de abajo del texto.


//La x definimos el punto, donde no habra nada por la derecha
//La y definimos el punto, donde no habra nada por arriba.
//Todo se mide, con la esquina del texto de abajo derecha. (Esta el allign asi)




///


















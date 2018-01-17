/// @desc Menu Create
var block = 0;


/// Example of block
	/// Block 0
	block = 0;
		// Elements
			hud_text[block, 2] = "Subnormal";
			hud_text[block, 1] = "Mana";
			hud_text[block, 0] = "Pringao";
		// Block Properities
		hud_vertical[block] = false;
		hud_horizontal[block] = true;
		hud_font[block] = fMenu;
		hud_color[block] = c_gray;
		// Dont touch
		hud_items_block[block] = array_length_2d(hud_text, block);
		m = GetArraysWidthHeight(block,hud_font[block]);
		// Example
		hud_x[block] = gui_width - gui_margin_horizontal;
		halign[block] = fa_right;
		hud_y[block] = gui_height - gui_margin_vertical;
		valign[block] = fa_bottom;
	/// Finish Block 0
	
/// Examples of Positions	
	/// Horizontal Mode
		// Borde Derecho
			hud_x[block] = gui_width - gui_margin_horizontal;
			halign[block] = fa_right;
		// Borde Izquierdo
			hud_x[block] = hud_width[block,m-1] - margin_horizontal + gui_margin_horizontal;
			halign[block] = fa_right;
		// Center Horizontal 
			hud_x[block] = (gui_width * 0.5) + hud_width[block,m-1]/2;
			halign[block] = fa_right;
		// Borde Superior
			hud_y[block] = hud_height[block,0] + gui_margin_vertical - margin_vertical;
			valign[block] = fa_bottom;
		// Borde Inferior
			hud_y[block] = gui_height - gui_margin_vertical;
			valign[block] = fa_bottom;
		// Center Vertical 
			hud_y[block] = (gui_height * 0.5) + hud_height[block,0]/2;
			valign[block] = fa_bottom;
	/// Vertical Mode
		// Borde Derecho
			hud_x[block] = gui_width - gui_margin_horizontal;
			halign[block] = fa_right;
		// Borde Izquierdo
			hud_x[block] = gui_margin_horizontal;
			halign[block] = fa_left;
		// Center Horizontal
			hud_x[block] = (gui_width * 0.5);
			halign[block] = fa_middle;
		// Borde Superior
			hud_y[block] = hud_height[block,0] + gui_margin_vertical - margin_vertical;
			valign[block] = fa_bottom;
		// Borde Inferior
			hud_y[block] = gui_height - gui_margin_vertical;
			valign[block] = fa_bottom;
		// Center Vertical 
			hud_y[block] = (gui_height * 0.5) + hud_height[block,m-1]/2 - hud_height[block,0]/2;
			valign[block] = fa_center;

	
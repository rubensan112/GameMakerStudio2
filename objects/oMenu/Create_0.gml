/// @desc GUI/Vars/Menu setup

///Menu setup
//Podemos ver en rMenu, en viewport[0], viewport Properities, the width and height of gui (de la pantalla)
gui_width = display_get_gui_width(); //Es casi toda la camara (width)
gui_height = display_get_gui_height();
gui_margin = 64;

menu_x = gui_width + 200; //El 200 es para que venga desde fuera de la camara. //Señala el x maximo. No excedera ese valor.
menu_y = gui_height - gui_margin; //Es decir parte del punto mas bajo, pero dejando el margen.
menu_x_target = gui_width - gui_margin; //El x target donde queremos que se pare. Establecido por el margin.
menu_speed = 20; //lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu); //Altura de cada item.
menu_commited = -1; //Init var
menu_control = true; //Init var

//Es mas eficiente declarar el indice de la lista mas elevado, asi reserva la memoria solo una vez.

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

//Opcion por defecto.
menu_cursor = 1;

w = 0;
w_bool = false;
letter = 0;
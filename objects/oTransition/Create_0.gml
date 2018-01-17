/// @description Size variables and mode setup

w = display_get_gui_width(); //Dice algo de que no depende de donde este la camara, como la barra de vida.
h = display_get_gui_height();
h_half = h * 0.5;

enum TRANS_MODE //Declaramos un enum
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
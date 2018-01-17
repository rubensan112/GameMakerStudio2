/// @desc Init
letter_position = 0; //Needed to draw text.
gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

//Select txt

txt[0] = "No hay tiempo para presentaciones. Mi familia... ha sido capturada, y es cuestion de tiempo que sean ejecutados. No tengo la fuerza para liberarlos, pero el oraculo predijo la llegada de un hechicero con la capacidad de potenciar mis habilidades hasta mas alla de la imaginacion."
txt[1] = "!! Y aqui estas !!"
txt[2] = "Vamos, no hay tiempo que perder."

txtDialogue = ds_map_create();
chooseTxt = 0;
list_length = array_length_1d(txt)

//Params
margin = 50;
y1_box = (gui_height) * (4/5) - 20;
margin_string = 20;
txt_speed = 0.58;

//txt = "hoha ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho hoaa ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho hoa ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho ho"

draw_set_font(fDialogue);

for (var i = 0; i < list_length; i++)
{
/// Reformat txt
	//Init vars
	txt_length = string_length(txt[i]);
	txt_width = string_width(txt[i]);
	var chr_width = (txt_width div txt_length); 
	var max_line_width = (gui_width-(margin + margin_string*2)) - (chr_width*2);
	var lines = (txt_width div (max_line_width));
	var line_length = (max_line_width div chr_width);
	n = 1;
	t = 0;
	//Add \n when needed
	while (n <= (lines))
	{
		if ((string_ord_at(txt[i], (n*line_length)-t)) != 32) //Black space is code 32
		{
			while ((string_ord_at(txt[i], (n*line_length)-t)) != 32)
			{
				t++;
			}
			txt[i] = string_delete(txt[i], (n*line_length)-t,1);
			//t++;
		}
			txt[i] = string_insert("\n", txt[i], (n*line_length)-t);
			//t=0;
			n++
	}
ds_map_add(txtDialogue, i, txt[i]);
}

/// @desc draw_text_speed (x, y, string, speed);
/// @arg x
/// @arg y
/// @arg string
/// @arg speed
/// @arg restart

var _xtext = argument0;
var _ytext = argument1;
var _txt = argument2;
var _txtSpeed = argument3;
var _enableSound = true;

_restart=argument4
if (_restart) letter_position = 0;

if (letter_position > string_length(_txt))
	{
		//_enable_draw_text = false;
		_enable_draw_text = true;
		_enableSound = false;
	}
else 
	{
		_enable_draw_text = true;
	}
if (_enable_draw_text)
	{
		draw_set_color(c_white);
		draw_set_font(fDialogue);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(_xtext,_ytext,string_copy(_txt, 1, (letter_position div 1))) //Coge el string desde el numero 1, hasta 'letter', que va iterando

		if (letter_position <= string_length(_txt))
			{
				letter_position+= _txtSpeed;
			}
		if ((((letter_position + _txtSpeed) div 1)) > (letter_position div 1)) && (_enableSound) && (!_restart)
		{
			audio_stop_all();
			audio_sound_pitch(sound0, random_range(0.7, 1.3));
			audio_play_sound(sound0,0,false);
			
		}
		

	}
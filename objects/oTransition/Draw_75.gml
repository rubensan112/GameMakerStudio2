/// @description Draw black bars

if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black); //Draw in the screen itself, dont worry about camara.
	draw_rectangle(0,0,w,percent*h_half,false); //El superior. Percent va variando de 1 a 0, y de 0 a 1.2. Por eso crece el rectuangulo.
	draw_rectangle(0,h,w,h-(percent*h_half),false);
	//Con esto conseguimos dibujar los rectangulos negros de la animacion de transicion.
	
}

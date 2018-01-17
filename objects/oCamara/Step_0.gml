/// @description Update Camara


//Update Destination
if  (instance_exists(follow))
{
		xTo = follow.x;
		yTo = follow.y;
}

//Update object position
x += (xTo - x) / 25; //Se mueve 1/25 de la distancia camara-jugador
y += (yTo - y) / 25;

// Keep camara center inside room . Avoid see outside the room
x = clamp(x, view_w_half+buff, room_width-view_w_half-buff); //Declara minimos y maximos.
y = clamp(y, view_h_half+buff, room_height-view_h_half-buff);// Lo del buff es culpa del screen shake
//que se ve outside the room. 

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);

shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos( cam, x-view_w_half, y-view_h_half);

// Moves the background.
if (layer_exists("Mountains"))
{
	//layer_x("Mountains",x) Asi se quedaria estatico. Nos seguiria completamente.
	layer_x("Mountains",x/2)
}
if (layer_exists("Trees"))
{
	//layer_x("Mountains",x) Asi se quedaria estatico. Nos seguiria completamente.
	layer_x("Trees",x/4)
}
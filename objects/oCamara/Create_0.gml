/// @description Set up Camara
cam = view_camera[0];
follow = oPlayer; // It can be change, easy
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart; //Creo que se refiere a la x, del anterior step.
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 16; //buffer. Con un valor de 32 no veriamos los 32 pixeles mas cercanos a los bordes.
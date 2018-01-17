/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
vsp = 0;
grv = 0.3;
hitfrom = 0;
//Flash
flash = 0; 
flash_bullet = 130; // Flash of oEnemyGun being shot. Mayor valor, mayor duracion el flash intermitente. 60 es el valor minimo.
flash_collision = 20; //Mayor valor, mayor duracion/segundo el flash intermitente.

key_jump = false;
disable_jump = 0;

triger = 0;

triger_disable = 0;
//Mode
jump = true;
quiet = false;
jump_quiet = false;
dont_fall = false;
jump_crazy = false;
chase = false;
escape = false;
//Combinaciones: jump + chase/escape, dont fall + chase/escape meh, jump_crazy + chase/escape.
//Estadisticas
walksp = 3; 
hsp = walksp;
//hsp = -walksp; Go to other direction at beggining
scale = 1;
hp = 4;
enemyPower = 1;
jump_quiet_jump = 12;
jump_jump_crazy = 4;
triger_distance_x = 10;
triger_distance_y = 64;
jump_force = 7;
sun_atack = false;
sun_atack_countdown = 0;
sun_atack_countdown_reverse = 0;
time=0;
real_time = 0;
countdown = false;
//reaction_at_hit = Pendiente de personalizar.

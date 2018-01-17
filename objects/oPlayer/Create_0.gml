/// @description Init

//Movement
hsp = 0;
vsp = 0;
grv = 0.4;
hascontrol = true;
//Number of jumps in leap
jumpsmax = 3;

jumpHeight = 11;
jumps = 0;
meleeDamage = 1;
//Controller Default
controller = 1; //1 is xbox, 0 is keyboard

//Stats
//Si llamo a las variables al inicializar la room, puedo modificarlas durante la room.
hp = global.playerHp;
walksp = global.playerSpeed;
playerPower = global.playerPower;
bulletDamage = global.playerBulletDamage;
TouchDamage = global.playerTouchDamage;
scale = 1;

//Animation Dead
dead_countdown= 0; //Init var
time_to_fall = 0.6; //Animation falling in seconds.

//Screen lose
dead_time = 1; //Total time in seconds in lose screen.
lose = false;

//Direction of the Enemy at collision. Not used yet.
hitfrom = 0; //Init var

//Flash Player
flash = 0;
flash_bullet = 100; // Flash of oEnemyGun being shot. Mayor valor, mayor duracion el flash intermitente. 60 es el valor minimo.
flash_collision = 20; //Mayor valor, mayor duracion/segundo el flash. 60 equivale a 1 segundo de flash por cada segundo de collision.

atack =false;
dash =false;
dash_lenght = 170;
dash_velocity = 0;
timeDash = 0;
acceleration_master = 350;
dash_cooldown = 0.45;
dash_cooldown_ = dash_cooldown;
disable_dash =false;

letter = 0;

//collision with oWallMove
stopWallMove = false;
ignoreMove = false;
vsp_save = 0;
hsp_save = 0;
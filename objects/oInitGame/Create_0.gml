/// @desc Save/Player Stats

//Declarate Save
#macro SAVEFILE "Save.sav" //Es la manera de crear constantes.


//Player Stats
global.playerHp = 1; //Life
global.playerSpeed = 5; //Speed movement
global.playerPower = 1; //Power of the bullets
global.playerPowerTouch = 1; //Damage to Enemy in contact. 60 is 1 hp/s in contact
global.bulletDamage = 1;
global.firingdelay = 5; //Lower is better.
global.playerBulletDamage = 1;
global.playerTouchDamage = 1;

//Game params
global.frames = 60;
window_set_fullscreen(true);
window_set_cursor(cr_none);
global.time = 0;
/// @desc Shake and Finish Game

if (win)
{
	time += delta_time/(1000000);
	ScreenShake(15,130);
}

if (time > 1.5) game_end();
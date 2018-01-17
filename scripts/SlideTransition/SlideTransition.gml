/// @desc SlideTransition(mode, targetroom)
/// @arg Mode sets transitions motde between next, restart, and goto.
/// @arg Target sets target room when using the goto mode.

with (oTransition)
{
	mode = argument[0]; //otra opcion es argument0 . Eso hace que ese argumento no sea opcional.
	if (argument_count > 1) target = argument [1];
}

/// @desc SlideTransition(mode, targetroom)
function SlideTransition() {
	// define your arguments
	/// @arg Mode sets transition mode to next, restart, and goto
	/// @arg Target sets target room when using the goto mode

	//Argument is the Transition object
	with (Transition)
	{
		mode = argument[0];
		if(argument_count>1) target = argument[1];
	
	}



}

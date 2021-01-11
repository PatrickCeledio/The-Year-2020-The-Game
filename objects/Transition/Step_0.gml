// Progress the transition

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{		
		//EASY CODE
		// Returns the greatest value 0 to percent-0.05
		// percent = max(0, percent-0.05);
		
		// ADVANCED CODE
		// Returns the biggest value between 0 and a tenth of percent
		percent = max(0, percent - max((percent/10),0.005));
		
	}
	else
	{
		// EASY CODE
		//percent = min(1, percent+0.05);
	
		// ADVANCED CODE
		// blackbarlapse because the restart transition takes time to have the screen go black
		percent = min(blackbarlapse, percent + max(((blackbarlapse-percent)/10), 0.005));
	}

	if(percent == blackbarlapse) || (percent == 0)
	{
		switch(mode)
		{
			case TRANS_MODE.INTRO:
			{
				// Breaks the whole if-statement
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
		}// end Switch
	}// end if () || ()	
}
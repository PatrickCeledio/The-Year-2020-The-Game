/// Size variables and mode setup


// Get the width and height(in pixels) of the GUI as used in the Draw GUI Event.
w = display_get_gui_width();
h = display_get_height();

h_half = h * 0.5;

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

// Sets the state of mode using TRANS_MODE 
mode = TRANS_MODE.INTRO;

// 1 = whole screen is black, 0 = whole screen is visible
percent = 1;
blackbarlapse = 1.2;

// In the case of mode = GOTO, target will store the room that the game will transition to.
target = room;

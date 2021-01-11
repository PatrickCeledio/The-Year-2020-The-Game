// Draw black bars

if (mode != TRANS_MODE.OFF)
{
	// Draws on the screen, not proportional to the game room
	draw_set_color(c_black);
	// (x1,y1,x2,y2 = percent * half of screen height)
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
	
}


// *** CAMERA SYSTEM ***

// Update destination

// if oPlayer is being followed is true
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if((follow).object_index == oPlayerDead)
	{
		// fix the camera onto oPlayerDead
		x = xTo;
		y = yTo;
	}
	
}

// Update object position

// Camera is moving 1/25 of oPlayer position
// Slower when close, and faster when far
x += (xTo - x)/10;
y += (yTo - y)/10;


// clamp is to maintain an input value between a specified range
x = clamp(x, view_w_half+buff, room_width - view_w_half-buff); 
y = clamp(y, view_h_half+buff, room_height - view_h_half-buff); 


// Screen shaking
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
// by removing 1/60th from shake_remain, it will eventually reach zero
// and that process will be the duration
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);


// Parallax Scrolling Code

if (room!= rMenu)
{
	// Parallax Scrolling
	if(layer_exists(background))
	{
		// Manipulate x coodination
		// x is our camera
		layer_x(background,x/2);
	}

	if(layer_exists(foreground))
	{
		// Manipulate x coodination
		// x is our camera
		layer_x(foreground,x/4);
	}
}

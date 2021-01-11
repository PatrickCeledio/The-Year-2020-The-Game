#region // **** PLAYER INPUT ****

if(hascontrol)
{
	// If user is using a keyboard
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	// If user is using a controller

	// absolute value(gamepad_axis_value(first controller, left analog stick horizontal axis) 
	// if the absolute value of the left analog stick value from moving it is greater than 0.2
	// 0.2 to ignore the deadzone, in the case of ever so slightly moving it 
	if ( abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		// User inputs to go left
		// Input is negative, in this case -7, 
		// abs(-7) = 7
		// CPU knows that player intends to move to the left (hence the negative) at analog stick value 7
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	
		// User inputs to go right
		// Input is positive, in this case 7
		// max(7,0) = 7
		// CPU knows that player intends to move to the right at analog stick value 7
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
	
		// Change value to confirm that user is on controller
		controller = 1;
	}

	// User inputs to jump using the analog stick
	if( gamepad_axis_value(0, gp_axislv) < -0.8 && jump_trigger = false)
	{
		jump_trigger = true;
		key_jump = 1;
		controller = 1;
	}
	
	if( gamepad_axis_value(0, gp_axislv) < -0.3) jump_trigger = false;

	// gp_face 1 refers to the 'A' button on the 360 controller
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;

	}
	
}
else
{
	
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	
} // end if(hascontrol)
#endregion

// Movement Calculation

// 'var' lasts one frame
var move = key_right - key_left;
hsp = move * walksp;

// Gravity, Vertical speed is the sum of vertical speed and gravity
vsp += grv;

// Jumping mechanic
// If on floor and key jump is pressed
canjump -= 1;
if (canjump > 0) && (key_jump){
	vsp = -7;
	canjump = 0;
}

// FYI: Built-in property 'x' represents x-coordinate

// **** COLLISION CHECKS ****

// Horizontal collision check
if(place_meeting(x+hsp,y,oWall))
	{
		while(!place_meeting(x+sign(hsp),y,oWall)){
		x += sign(hsp);
	}
	
	hsp = 0;
}else x += hsp; 

// Vertical collision check
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y+=sign(vsp);
	}
	vsp = 0;
}else y += vsp; 

// Animation

// If not on floor
if (!place_meeting(x,y+1,oWall)){
	sprite_index = sPlayerA;
	
	// Multiplier that sets the speed of the sprite animation
	image_speed = 0;
	
	// if sprite is moving down, set to second frame, or image 1.
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
}else{
	// Every frame the player is touching the floor
	canjump = 10;
	
	// When the player lands 
	if (sprite_index == sPlayerA) 
	{	
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding, 4, false);
	}
	image_speed = 1; 
	if (hsp == 0) sprite_index = sPlayer; else sprite_index = sPlayerR;	
}

if (hsp != 0) image_xscale = sign(hsp);

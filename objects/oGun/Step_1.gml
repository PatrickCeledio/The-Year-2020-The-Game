x = oPlayer.x;
y = oPlayer.y+1;

// If player is playing with mouse and keyboard
if(oPlayer.controller == 0)
{
	
	// set angle of gun based on mouse location on screen
	image_angle = point_direction(x,y,mouse_x,mouse_y);

// If player is playing with controller
}else if (oPlayer.controller = 1)
{
	// variables to record direction of what player is aiming on controller
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	
	// dismiss deadzone
	if(abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		// controllerangle = exact direction of what user is aiming towards
		controllerangle = point_direction(0,0, controllerh, controllerv);
	}
	// set angle of gun based on right analog stick direction
	image_angle = controllerangle;
}

firingdelay -= 1;
recoil = max(0, recoil-1);

/* SHOOTING FUNCTIONALITY */

// If player is on mouse and keyboard
if (mouse_check_button(mb_left) && (firingdelay < 0)){

	// Set recoil variables
	recoil = 4;
	firingdelay = 5;
	
	// Set screen to shake when bullets are shot
	ScreenShake(2,10);
	
	// Set bullet sounds with bullets are shot
	audio_sound_pitch(snShot, choose(0.8, 1.0));
	audio_play_sound(snShot, 5, false);

	// Produces the instance where bullets appear
	// and then the with statement allows us to 
	// assign the bullet speed & direction
	with(instance_create_layer(x,y,"BulletLayer",oBullet)){
		speed = 25;
		// other refers to the property of the original object
		// in this case object oGun
		direction = other.image_angle + random_range(-4,4);
		// updates the bullet direction
		image_angle = direction;
	}
}

// If player is on controller; right trigger to fire gun
if (gamepad_button_check(0,gp_shoulderrb) && (firingdelay < 0)){

	// Set recoil variables
	recoil = 4;
	firingdelay = 5;
	
	// Set screen to shake when bullets are shot
	ScreenShake(2,10);
	
	// Set bullet sounds with bullets are shot
	audio_sound_pitch(snShot, choose(0.8, 1.0));
	audio_play_sound(snShot, 5, false);
	
	// Produces the instance where bullets appear
	// and then the with statement allows us to 
	// assign the bullet speed & direction
	with(instance_create_layer(x,y,"BulletLayer",oBullet)){
		speed = 25;
		// other refers to the property of the original object
		// in this case object oGun
		direction = other.image_angle + random_range(-4,4);
		// updates the bullet direction
		image_angle = direction;
	}
}

if (gamepad_button_check(0,gp_shoulderrb)){
	// Set controller to vibrate when bullets are shot
	// With alarm set to switch vibration off after half a second
	gamepad_set_vibration(0, 1, 1);
	alarm[0] = game_get_speed(gamespeed_fps)/2;
}

// to add kickback to the gun
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

// to appropriately face the gun the opposite direction
if (image_angle > 90) && (image_angle < 270) image_yscale = -1; else image_yscale = 1;
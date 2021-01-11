// Create is like initializing the logic of our object

// Initial movement Speed
hsp = 0;
vsp = 0;

// Gravity 
grv = 0.4;

// Walk speed
walksp = 6;

// Variable will check weather or not user is using a controller
controller = 0;

// Left analog stick controller angle
jump_trigger = false;

// User has control?
hascontrol = true;

// Jump buffer
canjump = 0;

audio_sound_pitch(snShot, 0.8);
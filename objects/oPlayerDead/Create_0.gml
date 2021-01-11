hsp = 3;
vsp = -4;
grv = 0.2; 
done = 0;

ScreenShake(6,60);
// to control the sprite directly
image_speed = 0;
// Choose sprite frame
image_index = 0;

// draws text on center
draw_set_halign(fa_center);
draw_text(x, y, "YOU FUCKING DIED!");

// Play audio
audio_stop_sound(snOST);
audio_play_sound(snGameOverMusic, 14, false); 
audio_play_sound(snMaleScreamOutOfPain, 15, false); 
audio_play_sound(snGameOverVoice, 14, false); 

// Slow-mo effect
game_set_speed(30, gamespeed_fps);
// switches oCamera to follow oPlayerDead object
with (oCamera) follow = other.id;
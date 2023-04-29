hsp = 3;
vsp = -4;
grv = 0.3; 
done = 0;

ScreenShake(6,25);
// to control the sprite directly
image_speed = 0;

audio_play_sound(choose(snZombieDeathMoan1, snZombieDeathMoan2, snZombieDeathMoan3),8, false);
audio_play_sound(choose(snBulletBodyImpact1, snBulletBodyImpact2, snBulletBodyImpact3), 10, false); 

// When player approaches, switch sprite frame to the doors open
if (instance_exists(oPlayer)) && (distance_to_point(oPlayer.x, oPlayer.y) < 65)
{
	image_index = 1;
}
else 
{
	image_index = 0;
}
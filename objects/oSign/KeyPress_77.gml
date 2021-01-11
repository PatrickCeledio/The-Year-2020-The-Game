/// @desc When the player is within 64 pixels of the sign post, prompt text

// Global Right Pressed - Whenever the right mouse key is pressed anywhere

// Radius 64 pixels
// Checks player position if it is within object position of 64 pixels 
if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64)) && (!instance_exists(oText))
{
	with(instance_create_layer(x,y-64,layer,oText))
	{
		// Text will be arbitary, other.text will be provided by oSign
		text = other.text;
		length = string_length(text);
	}
	
	with(oCamera)
	{
		follow = other.id;
	}
}
//gravity
vsp += grv;

// Don't Walk Off Edges
if (grounded) && (afraidOfHeights) && (!place_meeting(x+sprite_width/2,y+1,oWall))
{
	// Flips the direction of the enemy
	hsp = -hsp;
}


// Horizontal collision check
if(place_meeting(x+hsp,y,oWall)){
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x += sign(hsp);
	}
	hsp = -hsp;
}else x += hsp; 

// Vertical collision check
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y+=sign(vsp);
	}
	vsp = 0;
}else y += vsp; 

// Animation
// If sprite is in the air and not in collision with walls or floor
if (!place_meeting(x,y+1,oWall))
{	
	grounded = false;
	sprite_index = sEnemyA;
	// multiplier that sets the speed of the sprite animation
	image_speed = 0;
	
	// if sprite is moving down, set to second frame, or image 1.
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
}else
{
	grounded = true;
	image_speed = 1; 
	if (hsp == 0) sprite_index = sEnemy; else sprite_index = sEnemyR;	
}

if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;

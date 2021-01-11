if (hp <= 0){
	
	// Creates oDead objects on the same layer as Enemy
	with(instance_create_layer(x,y,layer,oDead)){
		
		
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		// Minus 2 to add the bounce
		vsp = lengthdir_y(3,direction) -2;
		
		// Sets the direction of the dead enemy
		// other.size references oEnemy instead of oDead in with statement
		if (sign(hsp) !=0) image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
		
		// Sound effects
		audio_play_sound(snBigZombie, 10, false);
	}	
	
	
	instance_destroy();	

}
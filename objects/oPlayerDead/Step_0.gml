if (done == 0){

	//gravity
	vsp += grv;
	// spin
	image_angle += 10;
	
	// built-in property 'x' represents x-coordinate
	// horizontal collision check
	if(place_meeting(x+hsp,y,oWall)){
		while(!place_meeting(x+sign(hsp),y,oWall)){
			x += sign(hsp);
		}
		hsp = 0;
	}else x += hsp; 

	// vertical collision check
	if(place_meeting(x,y+vsp,oWall)){
		// after the corpse is spinning, it'll land 90 degrees to the ground no matter what
		image_angle = 0;
		// if object is moving down
		if (vsp > 0){
			
			done = 1;
			image_index = 1;
			audio_play_sound(snBodyThud, 9, false); 
			audio_play_sound(snDeathCurdle, 10, false); 
			alarm[0] = 60;
		}
		while(!place_meeting(x,y+sign(vsp),oWall)){
			y+=sign(vsp);
		}
		vsp = 0;
	}else y += vsp; 

}
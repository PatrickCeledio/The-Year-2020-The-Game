if (done == 0){

	//gravity
	vsp += grv;
	image_angle += 0;

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
		
		// if object is moving down
		if (vsp > 0){
			done = 1;
			image_index = 1;
		}
		while(!place_meeting(x,y+sign(vsp),oWall)){
			y+=sign(vsp);
		}
		vsp = 0;
	}else y += vsp; 
	
}
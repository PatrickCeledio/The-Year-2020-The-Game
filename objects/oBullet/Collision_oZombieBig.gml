// other refers to the unique oEnemy object the bullet hits
with(other){
	hp -= 1;
	flash = 3;

	// Direction is a keyword in GMS2 used to set the direction of movement of the instance 
	// when the instance has a speed other than 0. 
	// Note that directions in GameMaker Studio 2 are usually calculated as 
	// 0° being right, 90° being up, 180° being left and 270° being down.
	
	// hitfrom stores the value of the trajectory of what direction oBullet hits oEnemy
	hitfrom = other.direction;
}

instance_destroy();
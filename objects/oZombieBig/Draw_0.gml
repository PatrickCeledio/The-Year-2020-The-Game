draw_self();


// this code makes the enemy flash when shot by oBullets
if (flash>0){
	
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
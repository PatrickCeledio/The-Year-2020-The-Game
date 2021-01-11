/// @desc Dying from oEnemy

// terminate gun object
with(oGun) instance_destroy();
instance_change(oPlayerDead, true);

// player corpse will fly opposite direction
direction = point_direction(other.x, other.y,x,y);
hsp = lengthdir_x(8, direction);
vsp = lengthdir_y(6, direction) - 2;
if (sign(hsp) != 0 ) image_xscale = sign(hsp);

// to animate the gun to fly
with(instance_create_layer(x,y,layer,oDeadGun))
{
	hsp = lengthdir_x(3, direction);
	vsp = lengthdir_y(3, direction) - 2;
	if (sign(hsp) != 0) image_xscale = sign(hsp);
	
}

// to animate the shopping bag to fly
if (instance_exists(oShoppingBag)){
	with(oShoppingBag) instance_destroy();
	with(instance_create_layer(x,y,layer,oDeadShoppingBag))
	{
		hsp = lengthdir_x(10, direction);
		vsp = lengthdir_y(3, direction) - 2;

	}
}
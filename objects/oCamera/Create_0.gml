// Setup camera

// Store the view camera into a variable 
cam = view_camera[0];

// Variable to store object for camera to follow
follow = oPlayer;

// since we want to center the camera on our player,
// this variable will store the value of the distance
// equidistant
view_w_half = camera_get_view_width(cam)* .5;
view_h_half = camera_get_view_height(cam)* .5;

// Initial coordinate of the camera
xTo = xstart;
yTo = ystart;

// Screen shake 
shake_length = 60;
shake_magnitude = 0;
shake_remain = 0;

// buff is short for buffer
buff = 32;

// Parallax Scrolling
background = layer_get_id("Skyline");
foreground = layer_get_id("Buildings");

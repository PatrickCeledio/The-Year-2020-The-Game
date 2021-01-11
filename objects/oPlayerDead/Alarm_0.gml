/// @desc Reset gamespeed + room

// Sets back FPS to 60 after dying
game_set_speed(60, gamespeed_fps);
// Transitions to room currently in
SlideTransition(TRANS_MODE.RESTART);
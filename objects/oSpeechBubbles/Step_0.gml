/// @desc Progress Text

letters += spd; 

// string_copy(text, first letter, letters);
// floor() returns the rounded down integer of the argument
text_current = string_copy(text, 1, floor(letters));

// Font to use for the signpost
draw_set_font(fSign);

// Gathers the height and width of the string in its font on screen in pixels
if (h==0) h = string_height(text);
w = string_width(text_current);

// Terminate when user presses any button on the keyboard or A on the controller
if (letters >= length) && (keyboard_check_pressed(vk_anykey)) || gamepad_button_check_pressed(0,gp_face1)
{
	instance_destroy();
	with (oCamera) follow = oPlayer;
}
/// @desc Control the menu


// Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

// User menu control
if(menu_control)
{
	if(keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
	{
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if(keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd))
	{
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items - 1; 
	}
	
	if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face1))
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4, 30);
		menu_control = false;
		audio_play_sound(snShot, 10, false);
		
		var _maxpads = gamepad_get_device_count();

		for (var i = 0; i < _maxpads; i++)
		{
		    if (gamepad_is_connected(i))
		    {
		        show_message("Controller detected on slot " + string(i) + "!: " + gamepad_get_description(i));
		    }
		}
	}
	
	// Toggle full screen
	if(keyboard_check_pressed(vk_f11)){
		if(window_get_fullscreen() == false)
		{
		    window_set_fullscreen(true);
		}
		else window_set_fullscreen(false);
	}
	
	if(keyboard_check_pressed(vk_f9)){
		if (audio_pause_sound(snOST) == true){
			audio_play_sound(snOST, 10, false);
		}else{
			audio_pause_sound(snOST);
		}
	}
	

	
	// For mouse control
	// To capture mouse coordinate at y
	var mouse_y_gui = device_mouse_y_to_gui(0);

	// To capture the mouse if it is hovering along the menu
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		// Formula to get mouse cursor
		// 3 div 10 = 3 as only 3 goes into 10 three times
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if(mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_width+200;
			menu_committed = menu_cursor;
			ScreenShake(4, 30);
			menu_control = false;
			audio_play_sound(snShot, 10, false);
		}
	}
}// End if(menu_control)


// Menu functions
if (menu_x > gui_width+150) && (menu_committed != -1)
{
	switch(menu_committed)
	{	
		// Quit
		case 0: 
			game_end(); 
			break;
		// Settings
		case 1:
			musicOff = true;
			break;
		// Load
		case 2: 
			if(!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT);
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
			break;
		// New Game
		case 3: 
			SlideTransition(TRANS_MODE.NEXT); 
			break;
 
	}
} // End if (menu_x > gui_width+150) && (menu_committed != -1)
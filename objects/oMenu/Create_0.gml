/// @desc GUI, variables, menu setup

// SAVEFILE will be a self-defined keyword for Save.sav
#macro SAVEFILE "Save.sav"

// Play music
audio_play_sound(snOST, 10, false);

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; // lower is faster
menu_font = fMenu; // 'fMenu' is an actual font we created
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Settings";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);
menu_cursor = 2;
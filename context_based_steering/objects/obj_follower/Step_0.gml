//Update target position
target_position = new vector2(mouse_x,mouse_y);

//Get direction
set_seek_interest();
set_danger();
choose_direction();

//Make object move
chose_dir += angle_difference(chosen_dir,chose_dir)/2;

x+= lengthdir_x(spd,chose_dir);
y+= lengthdir_y(spd,chose_dir);
image_angle += angle_difference(chose_dir,image_angle)/8;
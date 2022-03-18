//Movement
spd = 1;

//Raycasting variables
sensor_count = 24;
sensor_length = 20;

//Direction variables
interest = array_create(sensor_count,0);
danger = array_create(sensor_count,0);
directions = array_create(sensor_count,0);
desired_directions = array_create(sensor_count,0);

chosen_dir = 0;
chose_dir = 0;

target_position = new vector2();

//set the possible directions
for(var i = 0; i < sensor_count;i++){
	var dir = 360/sensor_count * i;
	directions[i] = dir;
}

//Resize the camera
view_width = 1080/8;
view_height = 1080/8;
window_scale = 6;

window_set_size(view_width*window_scale,view_height*window_scale);
surface_resize(application_surface,view_width*window_scale,view_height*window_scale);


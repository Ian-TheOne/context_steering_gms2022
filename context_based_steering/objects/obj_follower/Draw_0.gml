draw_self();
/*
//Draw lines
for (i=0;i<sensor_count;i++){
	var current = desired_directions[i];
	
	var len = current * sensor_length;
	var dir = (360 / sensor_count) * i;
	
	draw_set_alpha(0.25);
	if(len > 0){
		//desired lines
		draw_set_color(c_lime);
		draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir));
		
	}else if (len < 0){
		//dangerous lines
		draw_set_color(c_red);
		draw_line(x,y,x+lengthdir_x(-len,dir),y+lengthdir_y(-len,dir));
		
	}
}

//draw desired direction
draw_set_alpha(1);
draw_set_color(c_aqua);

var len = length_direction(sensor_length,sensor_length,chose_dir);

draw_line(x,y,x+len.x,y+len.y);
draw_text(x + 64 ,y,chosen_dir)
*/

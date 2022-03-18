function set_seek_interest(){
	//Get the target direction
	var goal_direction = point_direction(x,y,target_position.x,target_position.y);
	
	for(var i = 0; i < sensor_count;i++){
		//get desirability from dot product
		var angle = (360 / sensor_count) * i;
		var difference = abs(angle_difference(angle,goal_direction));
		var len = length_direction(1,1,difference);
		
		var dot = dot_product(len.x,len.y,1,0);

		interest[i] = dot;
	}
}

function set_danger(){
	var danger_list = ds_list_create();
	for(var i = 0; i < sensor_count;i++){
		
		danger[i] = 0;
		//cast a ray to find danger
		var angle = (360 / sensor_count) * i;

		var col = pixelcast(x,y,x+lengthdir_x(sensor_length,angle),y+lengthdir_y(sensor_length,angle),5,par_danger);
		var distance = 0;
		
		//if the ray hits someting set the danger to the distance to object
		if(col[0] != noone)distance = point_distance(x,y,col[1],col[2]);
		
		danger[i] = min(0,-distance);
		
	}
	ds_list_destroy(danger_list);
}

function choose_direction(){
	//variables to get average of desirable angles
	var tarx =0,tary=0;
	
	for(var i = 0; i < sensor_count;i++){
		//populate array with desirable directions while removing dangerous directions
		desired_directions[i] = interest[i] + danger[i];
		desired_directions[i] = max(-1,desired_directions[i]);
		
		//get a bias with the current direction to the previous direction
		var dir = (360 / sensor_count) * i;
		var diff = abs(angle_difference(dir,chosen_dir));
		
		//add directions to a vector
		tarx += lengthdir_x(desired_directions[i],dir) * sqr((180 - diff) / 180)*2;
		tary += lengthdir_y(desired_directions[i],dir) * sqr((180 - diff) / 180)*2;
		
	}
	//set desired direction
	chosen_dir = point_direction(0,0,tarx,tary)
}
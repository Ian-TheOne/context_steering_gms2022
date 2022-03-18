
function length_direction(x_length,y_length,direction){
	return new vector2(lengthdir_x(x_length,direction),lengthdir_y(y_length,direction));
}

function pixelcast(xfrom,yfrom,xto,yto,width,object){
	// Probing distance
	var dx = 0;
	var dy = 0;

	// Get the first hit
	var first_instance = collision_line(xfrom, yfrom, xto, yto, object,true,true);

	// If hit, find the exact hit point
	if (first_instance != noone)
	{
	    // Init probing distance
	    dx = xto - xfrom;
	    dy = yto - yfrom;
	    // Start the search algorithm down to the pixel level
	    while ( (abs(dx) >= 1) || (abs(dy) >= 1) )
	    {
	        // Bisect the probing distance
	        dx /= 2;
	        dy /= 2;
	        // Check along the new collision line
	        var instance = collision_line(xfrom, yfrom, xto - dx, yto - dy, object, true, true);
	        // If something is hit, keep track of it and reduce the total distance to check for
	        if (instance != noone)
	        {
	            first_instance = instance;
	            xto -= dx;
	            yto -= dy;
	        }
	    }
	}

	// Set return array
	var return_array = array_create(3, -1);
	return_array[0] = first_instance;
	return_array[1] = xto - dx;
	return_array[2] = yto - (dy * 2);
	return return_array;
}
/// @description				Basic, flat position adjustment calculation.
/// @param {Real} xFactor		Horizontal control input.
/// @param {Real} yFactor		Vertical control input.
/// @param {Array} out__array	Provided array to insert outputs in.
function basic_movement(xFactor, yFactor, out__array) {
	// Direction of movement. Point direction returns the angle of (x,y) compared to center;
	// Degree is based on standard counterclockwise direction measurement.
	var directione = point_direction(0, 0, xFactor, yFactor);
	
	// Degree of input. Point distance returns a magnitude of the vector between (0,0) and (x, y);
	// Clamped to -1 / 1 to prevent diagonal movement being faster.
	var length = maxSpeed * clamp(point_distance(0, 0, xFactor, yFactor), -1, 1);
	
	// Yada yada, gets the (x,y) components of a point "length" pixels away in "directione" direction.
	out__array[0] = lengthdir_x(length, directione);
	out__array[1] = lengthdir_y(length, directione);
}

function spin_hit(plr_x, plr_y) {
	instance_create_layer(plr_x, plr_y, "Instances", obj_player_spin_hit);
}
// When this bubble wall is hit, make a particle effect, then start the destruction alarm.
// Also start the reforming alarm. Weird, I know.
//instance_create_layer(x, y, "Instances1", obj_particle_bubbles); Whoever removed the object for particles,
// this is why the game was crashing. - CTD
alarm[0] = 10;
alarm[1] = frames_to_reform;
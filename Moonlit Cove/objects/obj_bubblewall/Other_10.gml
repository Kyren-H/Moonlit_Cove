// When this bubble wall is hit, make a particle effect, then start the destruction alarm.
// Also start the reforming alarm. Weird, I know.
instance_create_layer(x, y, "ParticlesTEMP", obj_particle_bubbles);
alarm[0] = 10;
alarm[1] = frames_to_reform;
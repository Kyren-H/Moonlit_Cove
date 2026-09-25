if (part_particles_count(particle_system) == 0) {
	part_system_destroy(particle_system);
	instance_destroy();
}
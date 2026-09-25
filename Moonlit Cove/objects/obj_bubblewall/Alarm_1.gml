// Check if player would be in the way.
mask_index = spr_bubblewall;

if (place_meeting(x, y, obj_player)) {
	mask_index = mask_empty;
	alarm[1] = 15;
} else {
	instance_create_layer(x, y, "ParticlesTEMP", obj_particle_bubbles);
	sprite_index = spr_bubblewall;
}
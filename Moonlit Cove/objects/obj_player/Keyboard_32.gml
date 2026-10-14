// Do the spinny thing on space press.
if (can_spin) {
	spin_hit(x, y);
	can_spin = false;
	alarm[0] = 30;
}
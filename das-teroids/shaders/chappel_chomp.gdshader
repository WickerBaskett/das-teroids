shader_type canvas_item;
render_mode skip_vertex_transform;

// Screen Space shader displayed on collection of the
// Chappell Chomp Powerup

void vertex() {
	
}

void fragment() {
	float alpha = sqrt(pow(sin(VERTEX.x), 2) + pow(VERTEX.y, 2));
	COLOR = vec4(1.0,1.0,1.0,alpha);
}

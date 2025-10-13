shader_type canvas_item;

uniform sampler2D screen_tex: hint_screen_texture, repeat_disable, filter_nearest;
uniform int num_tones = 4;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 color = texture(screen_tex, SCREEN_UV).xyz;

	// Grayscale conversion
	float luminence = ((color.r * 0.3) + (color.g * 0.59) + (color.b * 0.11)) * (float(num_tones));

	float adjusted = floor(luminence);
	COLOR = vec4(vec3(adjusted / (float(num_tones) - 1.0)), 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

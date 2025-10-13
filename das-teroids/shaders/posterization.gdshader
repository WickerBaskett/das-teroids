shader_type canvas_item;

uniform sampler2D screen_tex: hint_screen_texture, repeat_disable, filter_nearest;
uniform int num_tones = 4;
uniform vec2 effect_origin = vec2(0.5);
uniform float start_time = 0.0;


vec4 posterize(vec2 screen_uv) {
	vec3 color = texture(screen_tex, screen_uv).xyz;

	// Grayscale conversion
	float luminence = ((color.r * 0.3) + (color.g * 0.59) + (color.b * 0.11)) * (float(num_tones));

	float adjusted = floor(luminence);
	return vec4(vec3(adjusted / (float(num_tones) - 1.0)), 1.0);
}

void fragment() {
	// Center circle on powerup origin
	vec2 pos = effect_origin - SCREEN_UV;
	
	// Vary radius with time since the powerup was collected
	float radius = sin(start_time - TIME);
	radius = 2.0 * smoothstep(1.0, 0.0, start_time - TIME);
	
	
	if (pow(radius, 2) > pow(pos.x, 2) + pow(pos.y, 2)) {
		COLOR = posterize(SCREEN_UV);
	}
	else {
		COLOR = texture(screen_tex, SCREEN_UV);
	}
	
}
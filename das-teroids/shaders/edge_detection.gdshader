shader_type canvas_item;

uniform sampler2D screen_tex: hint_screen_texture, repeat_disable, filter_nearest;

// Definition of Sobel Operators
const mat3 sv = mat3(vec3(-1, 0, 1),
				     vec3(-2, 0, 2),
				     vec3(-1, 0, 1));

const mat3 sh = mat3(vec3(-1, -2, -1),
				     vec3(0, 0, 0),
					 vec3(1, 2, 1));

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Construct 3x3 matrix of surrounding pixels
	mat3 pixels;
	for(int i = 0; i < 3; ++i) {
		for(int j = 0; j < 3; ++j) {
			vec3 curr_pix = texelFetch(screen_tex, ivec2(FRAGCOORD.xy) + ivec2(i, j), 0).xyz;
			// Sobel operator works best on grayscale image so we do a weighted conversion to grayscale
			vec3 grayscale = vec3(curr_pix.r * 0.3, curr_pix.g * 0.59, curr_pix.b * 0.11);
			pixels[i][j] = grayscale.r + grayscale.g + grayscale.b;
		}
	}
	
	// Convolve the surrounding pixels with the vertical sobel operator
	float v_convul = dot(pixels[0], sv[0]) + dot(pixels[1], sv[1]) + dot(pixels[2], sv[2]);
	float h_convul = dot(pixels[0], sh[0]) + dot(pixels[1], sh[1]) + dot(pixels[2], sh[2]);
	float val = sqrt(pow(v_convul, 2) + pow(h_convul,2));
	
	val = smoothstep(1.0, 1.0, val);
	
	if (val > 0.0) {
		COLOR = vec4(1.0, 1.0, 1.0, 1.0);
	}
	else {
		COLOR = texelFetch(screen_tex, ivec2(FRAGCOORD.xy), 0);
	}
	
	COLOR = vec4(vec3(val), 1.0);
	
	//COLOR = texture(screen_tex, UV);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

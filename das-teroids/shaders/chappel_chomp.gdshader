shader_type canvas_item;

uniform sampler2D effect;

void vertex() {
	// Called for every vertex the material is visible on.
}

// Psuedo Random Number function, found here: https://godotshaders.com/snippet/random-value
float rand(vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}


void fragment() {
	/*
	float r_val = rand(UV + vec2(TIME, 0.0));
	vec2 offset;

	// Each case represents one of the eight surrounding pixels
	if (r_val < (1.0/9.0)) { offset = vec2(0.0,0.0); }
	else if (r_val < (2.0/9.0)) { offset = vec2(1.0,0.0); }
	else if (r_val < (3.0/9.0)) { offset = vec2(1.0,-1.0); }
	else if (r_val < (4.0/9.0)) { offset = vec2(0.0,-1.0); }
	else if (r_val < (5.0/9.0)) { offset = vec2(-1.0,-1.0); }
	else if (r_val < (6.0/9.0)) { offset = vec2(-1.0,0.0); }
	else if (r_val < (7.0/9.0)) { offset = vec2(-1.0,1.0); }
	else if (r_val < (8.0/9.0)) { offset = vec2(0.0,1.0); }
	else { offset = vec2(1.0,1.0); }


	if (r_val < (1.0/5.0)) { offset = vec2(0.0,0.0); }
	else if (r_val < (2.0/5.0)) { offset = vec2(1.0,0.0); }
	else if (r_val < (3.0/5.0)) { offset = vec2(0.0,-1.0); }
	else if (r_val < (4.0/5.0)) { offset = vec2(-1.0,0.0); }
	else { offset = vec2(0.0,1.0); }


	//COLOR = texture(effect, UV + (offset * SCREEN_PIXEL_SIZE));
	COLOR = vec4(vec3(1.0 - texture(effect, UV + (offset * SCREEN_PIXEL_SIZE)).xyz), texture(effect, UV + (offset * SCREEN_PIXEL_SIZE)).a);
	*/
	COLOR = texture(effect,UV);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

shader_type canvas_item;

uniform vec4 strength_color : source_color = vec4(1.0, 0.2, 0.2, 1.0);
uniform vec4 dexterity_color : source_color = vec4(0.6, 1.0, 0.2, 1.0);
uniform vec4 intellect_color : source_color = vec4(0.2, 1.0, 1.0, 1.0);
uniform vec4 will_color : source_color = vec4(0.6, 0.2, 1.0, 1.0);
uniform int flag_type : hint_range(0, 3) = 0;

uniform float speed: hint_range(0., 10.) = 0.5;
uniform float angle: hint_range(0., 360.) = 45;
uniform float strength: hint_range(0., 1.) = 1.0;

vec4 color_without_strength(vec2 uv) {
	float hue = uv.x * cos(radians(angle)) - uv.y * sin(radians(angle));
	hue = fract(hue + fract(TIME  * speed));
	
	if (hue  < 4.0/12.0) {
		return dexterity_color;
	} else if (4.0/12.0 < hue  && hue  < 8.0/12.0) {
		return intellect_color;
	} else if (8.0/12.0 < hue) {
		return will_color;
	}
	
	 //if (0.0/12.0 < uv.x && uv.x < 5.5/12.0) {
		//return mix(dexterity_color, intellect_color, uv.x);
	//} else if (5.5/12.0 < uv.x && uv.x < 6.5/12.0) {
		//vec4 new_color = intellect_color;
		//return new_color;
	//} else {
		//return mix(intellect_color, will_color, uv.x);
	//}
	
	//if (uv.x < 2.0/12.0) {
		//return dexterity_color;
	//} else if (2.0/12.0 < uv.x && uv.x < 5.0/12.0) {
		//return mix(dexterity_color, intellect_color, uv.x);
	//} else if (5.0/12.0 < uv.x && uv.x < 7.0/12.0) {
		//return intellect_color;
	//} else if (7.0/12.0 < uv.x && uv.x < 10.0/12.0) {
		//return mix(intellect_color, will_color, uv.x);
	//} else {
		//return will_color;
	//}
}

vec4 color_without_dexterity(vec2 uv) {
	if (uv.x < 1.0/3.0) {
		return intellect_color;
	} else if (1.0/3.0 < uv.x && uv.x < 2.0/3.0) {
		return will_color;
	} else {
		return strength_color;
	}
}

vec4 color_without_intellect(vec2 uv) {
	if (uv.x < 1.0/3.0) {
		return will_color;
	} else if (1.0/3.0 < uv.x && uv.x < 2.0/3.0) {
		return strength_color;
	} else {
		return dexterity_color;
	}
}

vec4 color_without_will(vec2 uv) {
	if (uv.x < 1.0/3.0) {
		return strength_color;
	} else if (1.0/3.0 < uv.x && uv.x < 2.0/3.0) {
		return dexterity_color;
	} else {
		return intellect_color;
	}
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	
	switch(flag_type) {
		case 0:
			COLOR = COLOR = mix(color, color_without_strength(UV), strength);
			break;
		case 1:
			COLOR = color_without_dexterity(UV);
			break;
		case 2:
			COLOR = color_without_intellect(UV);
			break;
		case 3:
			COLOR = color_without_will(UV);
			break;
	}
}

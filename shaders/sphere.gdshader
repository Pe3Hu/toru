shader_type canvas_item;

uniform float speed_phase = 0.5;
uniform float speed_rotation = 0.5;
uniform float offset_phase = 0.0;
uniform float offset_rotation = 0.0;
uniform float frequency = 0.5;
uniform float scale = 1.0;
uniform float contrast = 3.0;

uniform vec4 color1: source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 color2: source_color = vec4(1.0, 1.0, 0.0, 1.0);

void fragment() {
        float time_phase = TIME * speed_phase * PI + offset_phase * PI * 2.0 + PI/2.0;
        float time_rotation = TIME * speed_rotation * PI / 4.0 + offset_rotation * PI * 2.0 / 360.0;
        float sinr = sin(time_rotation);
        float cosr = cos(time_rotation);
        // normalise and adjust scale
        vec2 uv = (UV - vec2(0.5)) * vec2(1.5) / sqrt(scale);
        // rotation [https://forum.godotengine.org/t/simple-texture-rotation-shader/24198/2]
        uv = vec2(uv.x * cosr - uv.y * sinr, uv.x * sinr + uv.y * cosr);
        // create wave structure
        float dist = length(uv);
        float val_phase = (sin(uv.x * PI * 3.0 * frequency + time_phase) + 1.0) * 0.5;
        vec4 color = color1 * val_phase + color2 * (1.0 - val_phase);
        // gaussian smoothing
        color *= smoothstep(0.0, 1.0, 1.0 - dist);
        color.a *= contrast;
        COLOR = vec4(color);
}
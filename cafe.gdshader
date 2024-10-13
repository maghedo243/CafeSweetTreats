shader_type canvas_item;

uniform int strength: hint_range(1, 512) = 2;

vec4 blur_size(sampler2D tex, vec2 uv, vec2 pixelSize) {
    vec4 color = vec4(0.0);
    float total = 0.0;
    
    // Strength of the blur
    float strengthFloat = float(strength);

    // Iterate over the area around the current UV coordinate to sample surrounding pixels
    for (float x = -strengthFloat; x <= strengthFloat; x++) {
        for (float y = -strengthFloat; y <= strengthFloat; y++) {
            // Offset the UV by the pixel size multiplied by the strength factor
            vec2 offset = vec2(x, y) * pixelSize;
            color += texture(tex, uv + offset);
            total += 1.0;
        }
    }
    
    // Average the color
    return color / total;
}

void fragment() {
    // Use TEXTURE to access the screen texture and TEXTURE_PIXEL_SIZE to get the size of each pixel
    COLOR = blur_size(TEXTURE, UV, TEXTURE_PIXEL_SIZE);
}
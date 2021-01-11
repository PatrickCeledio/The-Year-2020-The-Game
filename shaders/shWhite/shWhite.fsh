//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Passes the color of the sprite to be drawn by the GPU
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	// vec4(R,G,B,Transparency);
	gl_FragColor = vec4(1.0,1.0,1.0,gl_FragColor.a);

}

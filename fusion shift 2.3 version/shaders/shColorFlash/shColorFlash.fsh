//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _alpha;
uniform float _r;
uniform float _g;
uniform float _b;

void main()
{
	vec4 cColor = texture2D( gm_BaseTexture, v_vTexcoord );
	if (cColor != 0.0)
	{
		gl_FragColor = vec4(_r,_g,_b,_alpha);
	}
}
